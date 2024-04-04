//
// chart.js: Contains javascript needed in chart tag.
//
!function ($) {
	
  var default_shapes = [ 'cross', 'square', 'dash', 'dot', 'disc', 'zigzag','diagonal', 'diagonal-right-left', 'square', 'diamond', 'triangle'];
	
  var locateAdditionalData = function(chart, datasetIndex, index){
	  if( !chart){
		  return null;
	  }
	  dataset = chart.config.data.datasets[datasetIndex] 
	  if(dataset){
		  //time chart or bar chart
		  if(dataset.additionalData){
			  return dataset.additionalData[index];
		  }
		  //pie chart
		  data = dataset.data[index].additionalData
		  if(data){
			  return data;
		  }
	  }
	  return null;
  }
  

	/**
	 * Returns true if `value` is an array, else returns false.
	 * @param {*} value - The value to test.
	 * @returns {Boolean}
	 * @function
	 */
	var isArray =  Array.isArray ? Array.isArray : function(value) {
		return Object.prototype.toString.call(value) === '[object Array]';
	}

	/**
	 * Returns `value` if defined, else returns `defaultValue`.
	 * @param {*} value - The value to return if defined.
	 * @param {*} defaultValue - The value to return if `value` is undefined.
	 * @returns {*}
	 */
	var valueOrDefault = function(value, defaultValue) {
		return typeof value === 'undefined' ? defaultValue : value;
	}

	/**
	 * Returns value at the given `index` in array if defined, else returns `defaultValue`.
	 * @param {Array} value - The array to lookup for value at `index`.
	 * @param {Number} index - The index in `value` to lookup for value.
	 * @param {*} defaultValue - The value to return if `value[index]` is undefined.
	 * @returns {*}
	 */
	var valueAtIndexOrDefault = function(value, index, defaultValue) {
		return valueOrDefault(isArray(value) ? value[index] : value, defaultValue);
	}
  
  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }
  $.jalios.chart = {
 
   	updatePattern : function(jsonConf){
   		var updatePattern = {};
   		var index =0;
   		if(jsonConf.data){
   			updatePattern.data={}
   	   		if(jsonConf.data.datasets){
   	   			updatePattern.data.datasets=[]
   	   			jsonConf.data.datasets.each( function(item){
   	   				if(item.backgroundColor){
   	   					if(Array.isArray(item.backgroundColor)){
   	   						newBackgroundColors =[];
	   	   				    item.backgroundColor.each(function(color){
	   	   				    	newBackgroundColors.push(pattern.draw(default_shapes[index % default_shapes.length], color))
	   	   				    	index ++;
	   	   				    });   	   					
	   	   	   				updatePattern.data.datasets.push({"backgroundColor" : newBackgroundColors});
   	   					}
   	   					else{
   	   						var currentPattern = pattern.draw(default_shapes[index % default_shapes.length], item.backgroundColor);
	   				    	index ++;
   	   						updatePattern.data.datasets.push({"backgroundColor" : currentPattern});
   	   					}
   	   				}
   	   				else{
   	   					updatePattern.data.datasets.push({});
   	   				}
   	   			});
   	   		}
   		}
		return updatePattern;
	},
	
	onChartClick : function(event, activeElts){
		var chart = this;
		var $canvas = $(chart.canvas)  
		var chartId = $canvas.data("jaliosChartId");
		if(activeElts && activeElts.length > 0){
			var datas = []
			var activePoints = chart.getElementAtEvent(event);
			$.each( activePoints , function(){
				var datasetIndex = this._datasetIndex;
				var index = this._index;				
				// locate additional data is any
				var additionalData = locateAdditionalData(chart, datasetIndex, index);
				datas.push({
					"datasetIndex": datasetIndex,
					"index":index,
					additionalData : additionalData					
				})
			});		
			//trigger internal jalios chart event
			$event = $.Event("jalios.chart.click", { 
				"chartEventInfos": {
					'chart': chart,
					"id": chartId,
					"data": datas
				},
				"originalEvent":  event
			});
			$canvas.trigger($event);
		}
	},	
	
	generateAlignedLegend : function(chart) {
		chart.legend.afterFit = function () {
			var width = this.width; 
		
			if(! this.lineWidths){
				return;
			}
			this.lineWidths =  this.lineWidths.map(function(x, i){ return width-12} );
		
		    this.options.labels.padding = 15;
		    this.options.labels.boxWidth = 20;
	  	};
		var data = chart.data;
		if (data.labels.length && data.datasets.length) {
		  return data.labels.map(function(label, i){
		    var meta = chart.getDatasetMeta(0);
		    var ds = data.datasets[0];
		    var arc = meta.data[i];
		    var custom = arc && arc.custom || {};
		    var getValueAtIndexOrDefault = valueAtIndexOrDefault;
		    var arcOpts = chart.options.elements.arc;
		    var fill = custom.backgroundColor ? custom.backgroundColor : getValueAtIndexOrDefault(ds.backgroundColor, i, arcOpts.backgroundColor);
		    var stroke = custom.borderColor ? custom.borderColor : getValueAtIndexOrDefault(ds.borderColor, i, arcOpts.borderColor);
		    var bw = custom.borderWidth ? custom.borderWidth : getValueAtIndexOrDefault(ds.borderWidth, i, arcOpts.borderWidth);
		
		    return {
		      text: label,
		      fillStyle: fill,
		      strokeStyle: stroke,
		      lineWidth: bw,
		      hidden: isNaN(ds.data[i]) || meta.data[i].hidden,
		
		      index: i
		    };
		  });
		}
		return [];
	}
  }

  // ------------------------------------------
  // DOM READY CODE
  // ------------------------------------------

  $(document).ready(function($) {
    JcmsLogger.info('Chart JS', 'Init chart JS ');
  });
}(window.jQuery);