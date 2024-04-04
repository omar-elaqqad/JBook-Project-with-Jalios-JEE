//extract from fork https://github.com/jalios/chartjs-lines-plugin
Chart.pluginService.register({
    afterDraw: function(chartInstance) {
        var yValue;
        var yScale = chartInstance.scales["y-axis-0"];
        var canvas = chartInstance.chart;
        var ctx = canvas.ctx;
        var index;
        var line;
        var style;

        if (chartInstance.options.horizontalLine) {
            for (index = 0; index < chartInstance.options.horizontalLine.length; index++) {
                line = chartInstance.options.horizontalLine[index];

                if (!line.style) {
                    style = "rgba(169,169,169, .6)";
                } else {
                    style = line.style;
                }

                if (line.y) {
                    yValue = yScale.getPixelForValue(line.y);
                } else {
                    yValue = 0;
                }

                ctx.lineWidth = 2;

                if (yValue) {
                    ctx.beginPath();
                    ctx.moveTo(chartInstance.chartArea.left, yValue);
                    ctx.lineTo(chartInstance.chartArea.right, yValue);
                    ctx.strokeStyle = style;
                    ctx.stroke();
                }

                if (line.text) {
                    ctx.fillStyle = style;
                    ctx.fillText(line.text,chartInstance.chartArea.right - ctx.measureText(line.text).width -5 , yValue + ctx.lineWidth);
                }
            }
            return;
        }
    }
});

Chart.pluginService.register({
    afterDraw: function(chartInstance) {
        var xValue;
        var xScale = chartInstance.scales["x-axis-0"];
        var canvas = chartInstance.chart;
        var ctx = canvas.ctx;
        var index;
        var line;
        var style;

        if (chartInstance.options.verticalLine) {
            for (index = 0; index < chartInstance.options.verticalLine.length; index++) {
                line = chartInstance.options.verticalLine[index];

                if (!line.style) {
                    style = "rgba(169,169,169, .6)";
                } else {
                    style = line.style;
                }

                if (line.x) {
                    xValue = xScale.getPixelForValue(line.x);
                } else {
                    xValue = 0;
                }

                ctx.lineWidth = 2;

                if (xValue) {
                    ctx.beginPath();
                    ctx.moveTo(xValue,chartInstance.chartArea.top);
                    ctx.lineTo(xValue, chartInstance.chartArea.bottom);
                    ctx.strokeStyle = style;
                    ctx.stroke();
                }

                if (line.text) {
                    ctx.fillStyle = style;
                    ctx.fillText(line.text, xValue + ctx.lineWidth, chartInstance.chartArea.top - ctx.lineWidth +10);
                }
            }
            return;
        }
    }
});