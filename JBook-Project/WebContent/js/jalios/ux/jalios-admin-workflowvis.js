!(function ($) {
  var renderGraph = function (data, options) {
    // Variables
    var layout = {
      heightCompressionFactor: 1.4,
      widthCompressionFactor: 0.9,
      nodesCloserMaxNodes: 7,
      nodesFartherMinNodes: 10,
      arrowHeadSize: 10,
      initialStateOffsetX: 2,
      initialStateOffsetY: 18,
      initialStateSize: '32px',
      controlButtonSize: '128px',
      controlButtonTop: '-400px',
      controlButtonLeft: '600px',
      mailActionSize: 18,
      mailActionOffsetX: 20,
      mailActionOffsetY: 22,
      margin: {
        top: 40,
        right: 60,
        bottom: 40,
        left: 60
      },
      nodeLabelOffset: 10,
      nodeRadius: 30,
      nodeLabelFontSize: '12px',
      edgeArrowHeadColor: '#aaa',
      edgeDefaultColor: '#ccc',
      edgeHoverColor: '#000',
      edgeLabelColor: '#aaa',
      edgeLabelFontSize: '10px',
      edgeLabelOffsetY: 15,
      canvasWidth: 1440,
      canvasHeight: 480
    };

    layout = $.extend({}, layout, JSON.parse(options || '{}'));

    //IE 11 specifics
    if ($('.browser-IE11').length) {
      layout.controlButtonTop = '-100px';
    }

    // Canvas dimensions
    var width = layout.canvasWidth - layout.margin.left - layout.margin.right,
      height = layout.canvasHeight - layout.margin.top - layout.margin.bottom;

    // List of node names
    var allNodes = data.states.map(function (d) {
      return d.name;
    });

    // bring nodes closer if small number of nodes
    if (allNodes.length <= layout.nodesCloserMaxNodes) {
      layout.widthCompressionFactor = layout.widthCompressionFactor * 2;
    }
    // more space between nodes if large number of nodes
    if (allNodes.length >= layout.nodesFartherMinNodes) {
      layout.widthCompressionFactor = layout.widthCompressionFactor / 1.5;
    }

    //Pan/zoom
    var panW = 2 * layout.canvasWidth;
    var panH = 2 * layout.canvasHeight;

    var zoom = d3
      .zoom()
      .scaleExtent([0.2, 10])
      .translateExtent([
        [-panW, -panW],
        [panW, panH]
      ])
      .on('zoom', zoomed);

    // add svg canvas
    var svg = d3
      .select('.workflow-view')
      .append('svg')

      //IE11
      .style('height', layout.canvasHeight)
      .style('width', layout.canvasWidth)

      .attr('viewBox', [
        -layout.margin.left * layout.widthCompressionFactor,
        height / 2,
        layout.canvasWidth,
        layout.canvasHeight
      ])
      .style('background-color', 'rgba(255,255,255,0)');
    //.style('opacity', 0.5)
    //add zoom controls
    var toolbar = d3
      .select('.workflow-view')
      .append('div')
      .attr('class', 'toolbar')
      .style('position', 'relative')
      .style('left', layout.controlButtonLeft)
      .style('top', layout.controlButtonTop)
      .style('pointer-events', 'none')
      .style('z-index', 0)
      .append('svg')
      .attr('width', 128)
      .attr('height', 128)
      .attr('viewBox', [0, 0, 512, 512])
      .append('g')
      .attr('transform', 'translate(0 128) scale(1)');

    toolbar
      .append('text')
      .attr('text-anchor', 'start')
      .attr('x', 0)
      .attr('y', 0)
      .attr('class', 'workflow-control zoom-in')
      .attr('style', 'font-family:FontAwesome;')
      .attr('cursor', 'pointer')
      .attr('pointer-events', 'all')
      .attr('font-size', layout.controlButtonSize)
      .text(function (d) {
        return '\uf00e';
      })
      .on('mouseover', function (e) {})
      .on('click', function (e) {
        zoomIn();
      });

    toolbar
      .append('text')
      .attr('text-anchor', 'start')
      .attr('x', 0)
      .attr('y', 128)
      .attr('class', 'workflow-control zoom-out')
      .attr('style', 'font-family:FontAwesome;')
      .attr('cursor', 'pointer')
      .attr('pointer-events', 'all')
      .attr('font-size', layout.controlButtonSize)
      .on('mouseover', function () {})
      .text(function (d) {
        return '\uf010';
      })
      .on('click', function (e) {
        zoomOut();
      });

    d3.select('body').on('keydown', function () {
      //escape to reset zoom
      if (d3.event.keyCode === 27) {
        resetZoom();
      }
    });

    var layer = svg.append('g').attr('transform', 'translate(' + layout.margin.left + ',' + layout.margin.top + ')');

    svg.call(zoom).on('wheel.zoom', null); //disable mouse wheel that conflicts with scrolling the page

    function zoomed() {
      // svg.attr("transform", d3.event.transform);
      layer.attr('transform', d3.event.transform);
    }

    function resetZoom(delay) {
      if (typeof delay === 'undefined') {
        delay == 700;
      }

      var zoomIdentity;

      if ($('.browser-IE11').length) {
        zoomIdentity = d3.zoomIdentity.scale(3).translate(-width / 4, -height / 2);
      } else {
        zoomIdentity = d3.zoomIdentity;
      }

      svg
        .transition()
        .duration(delay)
        .call(zoom.transform, zoomIdentity, d3.zoomTransform(svg.node()).invert([width / 2, height / 2]));
    }

    function zoomIn() {
      svg.transition().call(zoom.scaleBy, 1.5);
    }

    function zoomOut() {
      svg.transition().call(zoom.scaleBy, 0.5);
    }

    resetZoom(0);
    // end zoom

    // Linear scale to position the nodes on the X axis
    var x = d3
      .scalePoint()
      .range([0, (width * 1) / layout.widthCompressionFactor])
      .domain(allNodes);

    // Arrow head marker
    // svg.append('defs')
    //   .append('marker')
    //   .attr("id", "marker")
    //   .attr("viewBox", "0 -5 10 10")
    //   .attr("refX", layout.arrowHeadSize)
    //   .attr("refY", 0)
    //   .attr("markerWidth", layout.arrowHeadSize)
    //   .attr("markerHeight", layout.arrowHeadSize)
    //   .attr("orient", "auto")
    //   .attr("xoverflow", "visible")
    //   .append('svg:path')
    //   .attr('d', 'M 0,-5 L 10 ,0 L 0,5')
    //   .attr('fill', '#000')
    //   .attr('stroke', '#000')
    // ;

    // Draw the edges
    var edgeDataMapping = function (d, i, unidirectional) {
      var start = x(d.source), // X position of starting / ending nodes
        end = x(d.target),
        y = height - 2 * layout.nodeRadius,
        dx = end - start,
        rdx = end - start,
        dy = y - y,
        dr = Math.sqrt(dx * dx + dy * dy);

      if (typeof unidirectional === 'undefined') {
        unidirectional = false;
      }

      //normal edge
      var drx = dr,
        dry = dr,
        xRotation = 0, // degrees
        largeArc = 0, // 1 or 0
        sweep = 1; // 1 or 0

      var linkData = [];

      if (start === end || d.wfLevel === 0) {
        //link to itself (self-edge)

        xRotation = -45;
        largeArc = 1;
        //sweep = 0;
        drx = 30;
        dry = 20;

        linkData = ['M', start, y, 'A', drx, ',', dry, xRotation, largeArc, ',', sweep, end + 1, ',', y + 1].join(' ');
      } else if (d.wfLevel === 1) {
        //nodes are next to each other ; draw a straight line

        var y2 = y + Math.floor(0.5 * layout.nodeRadius * 2);
        linkData = ['M', start, y2, 'Q', start + 10, y2 + 10, end, y2].join(' ');
      } else {
        //nodes are far from each other ; draw arc

        var arcTopBottom; //alternate between top/down arc curves

        var reversedArc = start > end;

        var y2 = y;
        var end2 = end;
        var start2 = start;
        var dx2 = dx;

        if (!reversedArc) {
          y2 = y2 + layout.nodeRadius;
        }

        arcTopBottom = reversedArc ? 1 : 0;

        if (reversedArc && unidirectional) {
          //unidirectional - draw the arc as if it were not reversed (used to avoid reverting labels on arc paths)

          end2 = start;
          start2 = end;
          dx2 = -dx;
        } else {
          if (reversedArc) {
            arcTopBottom = 0;
          }
        }

        linkData = [
          'M',
          start2,
          y2, // Arc starting at x=start, y=height-30
          'A', //elliptical arc
          (-dx2 / 2) * layout.heightCompressionFactor,
          ',', // Inflexion point (proportional with start - end distance)
          (-dx2 / 2) * layout.heightCompressionFactor,
          0,
          0,
          ',',
          arcTopBottom,
          end2,
          ',',
          y2
        ].join(' ');
      }

      return linkData;
    };

    var getBaseUrl = function () {
      return location.href.replace(location.hash, '');
    };

    var links = layer
      .selectAll('.links')
      .data(data.transitions)
      .enter()
      .append('path')
      .attr('pointer-events', 'none')
      .style('fill', 'none')
      .style('stroke-width', '1px')
      .attr('stroke', layout.edgeDefaultColor)
      .attr('d', function (d, i) {
        return edgeDataMapping(d, i, false);
      })
      .attr('id', function (d, i) {
        return 'edgeId' + i;
      });

    // .attr('marker-end','url(#marker)')

    var linksUni = layer
      .selectAll('.linksUni')
      .data(data.transitions)
      .enter()
      .append('path')
      .style('opacity', '0')
      .attr('d', function (d, i) {
        return edgeDataMapping(d, i, true);
      })
      .attr('id', function (d, i) {
        return 'edgeUniId' + i;
      });

    var edgeArrowHeads = layer
      .selectAll('.edgeArrowHead')
      .data(data.transitions)
      .enter()
      .append('text')
      .attr('pointer-events', 'none')
      .attr('class', 'edge arrowhead')
      .attr('dx', 0)
      .attr('dy', 5)
      .attr('style', 'font-family:Arial;')
      .style('font-size', '16px')
      .style('text-anchor', 'middle')
      .style('fill', layout.edgeArrowHeadColor)
      .append('textPath')
      .attr('pointer-events', 'none')
      .attr('startOffset', '52%')
      .attr('xlink:href', function (d, i) {
        return getBaseUrl() + '#edgeId' + i;
      })
      .text(function (d, i) {
        return '\u25ba';
      });

    // Draw nodes (circles)
    var nodes = layer
      .selectAll('.wk-nodes')
      .data(data.states)
      .enter()
      .append('circle')
      .attr('id', function (d, i) {
        return 'nodeId' + i;
      })
      .attr('cx', function (d) {
        return x(d.name);
      })
      .attr('cy', height - layout.nodeRadius)
      .attr('r', layout.nodeRadius)
      .attr('class', function (d) {
        return 'wk-node';
      })
      .style('fill', function (d) {
        return d.stateColor;
      })
      .style('stroke', '#000')
      .style('stroke-width', '0px')
      .style('opacity', 1);

    // Initial state attribute
    layer
      .selectAll('.wk-nodes')
      .data(data.states)
      .enter()
      .filter(function (d, i) {
        return d.initState === true;
      })
      .append('text')
      .attr('style', 'font-family:FontAwesome;')
      .style('pointer-events', 'none') //disable hovering the static icon
      .attr('font-size', layout.initialStateSize)
      .attr('x', function (d) {
        return x(d.name) - layout.initialStateOffsetX;
      })
      .attr('y', function (d) {
        return height - layout.initialStateOffsetY;
      })
      .text(function (d) {
        return '\uf0da';
      });

    var edgeLabels = layer
      .selectAll('.edgeLabel')
      .data(data.transitions)
      .enter()
      .append('text')
      .style('pointer-events', 'none')
      .attr('class', 'label')
      .attr('dx', 0)
      .attr('dy', layout.edgeLabelOffsetY)
      .attr('style', 'font-family:Arial;')
      .style('fill', layout.edgeLabelColor)
      .style('font-size', layout.edgeLabelFontSize)
      .attr('font-weight', function (d, i) {
        return 100; /*normal*/
      })
      .style('text-anchor', 'middle')
      .style('fill', '#000')
      // .attr("transform", "translate(0,0) rotate(180)")

      .append('textPath')
      .style('pointer-events', 'none')
      .attr('startOffset', '52%')
      .attr('xlink:href', function (d, i) {
        return getBaseUrl() + '#edgeUniId' + i;
      })

      .text(function (d, i) {
        return '' || d.wfGroups;
      });

    // Draw node labels
    let labelRightBounds = [];
    let addHeightToPreventOverlapping = 0;
    var nodeLabels = layer
      .selectAll('.nodeLabels')
      .data(data.states)
      .enter()
      .append('text')
      .style('pointer-events', 'none')
      .attr('style', 'font-family:Arial;')
      .style('font-size', layout.nodeLabelFontSize)
      .attr('font-weight', function (d, i) {
        return 700; /*bold*/
      })
      .text(function (d) {
        return d.name;
      })
      .attr('x', function (d) {
        return x(d.name);
      })
      .attr('y', function (d) {
        labelRightBounds.push(this.getBBox());

        // DIRTY Trick to prevent labels overlaps
        // If the previous label width and X position is above X position of current label
        // We move it to prevent the overlap
        if (labelRightBounds.length > 1) {
          let previousBBox = labelRightBounds[labelRightBounds.length - 2];
          let previousBBoxEndX = previousBBox.x + previousBBox.width;
          if (previousBBoxEndX > this.getBBox().x) {
            addHeightToPreventOverlapping = addHeightToPreventOverlapping === 0 ? this.getBBox().height : 0;
          } else {
            addHeightToPreventOverlapping = 0;
          }
        }
        return height + layout.nodeLabelOffset + addHeightToPreventOverlapping;
      })

      .style('text-anchor', 'middle');

    // edges highlighting
    nodes
      .on('mouseover', function (d) {
        d3.select(this);

        edgeArrowHeads.style('opacity', function (linkD) {
          return linkD.source === d.name || linkD.target === d.name ? 1 : 0.2;
        });

        edgeLabels
          .style('opacity', function (linkD) {
            return linkD.source === d.name || linkD.target === d.name ? 1 : 0.2;
          })
          .each(function (d) {
            d3.select(this).raise();
          });

        links
          .style('opacity', function (linkD) {
            return linkD.source === d.name || linkD.target === d.name ? 1 : 0.2;
          })
          .style('stroke', function (linkD) {
            return linkD.source === d.name || linkD.target === d.name ? layout.edgeHoverColor : layout.edgeDefaultColor;
          });
      })
      .on('mouseout', function (d) {
        edgeArrowHeads.style('opacity', '1');

        edgeLabels.style('opacity', '1');
        links.style('stroke', layout.edgeDefaultColor).style('stroke-width', '1').style('opacity', '1');
      });

    // Action State Attributes
    layer
      .selectAll('.wk-nodes')
      .data(data.states)
      .enter()
      .filter(function (d, i) {
        return (
          d.recUser === true ||
          d.recWorker === true ||
          d.recManager === true ||
          d.sendUser === true ||
          d.sendWorker === true ||
          d.sendManager === true
        );
      }) //Action in filter.
      .append('image')
      .attr('xlink:href', function (d) {
        return 'images/jalios/workflow/bell2.svg';
      })
      .attr('width', layout.mailActionSize)
      .attr('height', layout.mailActionSize)
      .attr('class', 'wk-icon')
      .style('fill', '#fff')

      //Place alert action on the bottom-right corner
      .attr('x', function (d) {
        return x(d.name) + layout.nodeRadius - layout.mailActionOffsetX / 2 - layout.mailActionSize / 2;
      })
      .attr('y', function (d) {
        return height - layout.mailActionOffsetY;
      })

      //Tooltip on alert
      .on('mouseover', function (d) {
        var targetPos = $(this).position();

        $(this).tooltip({
          title: d.info,
          container: '.workflow-view',
          html: true,
          placement: 'right',
          trigger: 'manual'
        });

        //hide all tooltips
        $('.workflow-view .tooltip').tooltip('hide');

        $(this).tooltip('show');

        $('.workflow-view .tooltip .tooltip-arrow').attr('style', ''); //move the tooltip arrow as well
      })

      .on('mouseout', function (d) {
        $(this).tooltip('hide');
      });
  };

  var register = function () {
    // Retrieve workflow markdown data from JSP
    var refreshWorkflowView = function (url, wfId, options) {
      d3.json(url + '?id=' + encodeURIComponent(wfId), function (data) {
        renderGraph(data, options);
      });
    };

    if (!$.jalios) {
      $.jalios = {};
    }
    if (!$.jalios.ui) {
      $.jalios.ui = {};
    }
    if (!$.jalios.ui.workflow) {
      $.jalios.ui.workflow = {};
    }
    $.jalios.ui.workflow.render = refreshWorkflowView;
  };

  // Plugin initialization on DOM ready
  $(document).on('jalios:ready', register);
})(window.jQuery);
