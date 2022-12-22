(function () {

    /// Collapse or Expand Rows when user clicks
    $(document).on('click', '.dgrid-row.rootHeader.rowCollapse', function () {
        var $currentElem = $(this);
        var total = $currentElem.attr("data-total");
        var appliedArrowClass = $.trim($(this).find('.dgrid-expando-icon').attr('class'));
        if (appliedArrowClass == "dgrid-expando-icon ui-icon ui-icon-triangle-1-se") { // change down arrow to up arrow
            $(this).find('.dgrid-expando-icon').attr('class', 'dgrid-expando-icon ui-icon ui-icon-triangle-1-e');
            $(this).find("td.dgrid-column-0-1").html('<a class="black" style="float: right;">' + total + '</a>');
            $currentElem.find('table tbody tr td:nth-child(1)').removeClass('dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left dgrid-focus').addClass("dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left dgrid-focus collapsedHeader");
            $currentElem.find('table tbody tr td:nth-child(2)').removeClass('dgrid-cell dgrid-cell-padding dgrid-column-0-1 black left').addClass("dgrid-cell dgrid-cell-padding dgrid-column-0-1 black left collapsedHeader right wrap grandTotalRow topSummary bold");
        }
        else { // change up arrow to down arrow
            $currentElem.find('table tbody tr td:nth-child(1)').removeClass('dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left dgrid-focus collapsedHeader').addClass('dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left dgrid-focus');
            $currentElem.find('table tbody tr td:nth-child(2)').removeClass('dgrid-cell dgrid-cell-padding dgrid-column-0-1 black left collapsedHeader right wrap grandTotalRow topSummary bold').addClass('dgrid-cell dgrid-cell-padding dgrid-column-0-1 black left');
            $(this).find('.dgrid-expando-icon').attr('class', 'dgrid-expando-icon ui-icon ui-icon-triangle-1-se');
            $(this).find("td.dgrid-column-0-1").html('');
        }

        if ($(this).next('.dgrid-tree-container').hasClass('forcedHide')) {
            $(this).next('.dgrid-tree-container').attr('style', 'display: block; height: auto;').removeClass('forcedHide');
        } else {
            $(this).next('.dgrid-tree-container').attr('style', 'display: block; height: 0px;').addClass('forcedHide');
        }

        //$(this).nextUntil('.dgrid-tree-container > .dgrid-row').slideToggle(100); // Collapse rows
    });

    /// Collapse or Expand Rows when user clicks
    $(document).on('click', '.dgrid-row.rootHeader', function () {
        var total = $(this).attr("data-total");
        var appliedArrowClass = $.trim($(this).find('.dgrid-expando-icon').attr('class'));
        if (appliedArrowClass == "dgrid-expando-icon ui-icon ui-icon-triangle-1-se") { // change down arrow to up arrow
            $(this).find('.dgrid-expando-icon').attr('class', 'dgrid-expando-icon ui-icon ui-icon-triangle-1-e');
            $(this).find("td.dgrid-column-0-1").html('<a class="black" style="float: right;">' + ((total === undefined || total === null) ? 0.00 : total) + '</a>');
        }
        else { // change up arrow to down arrow
            $(this).find('.dgrid-expando-icon').attr('class', 'dgrid-expando-icon ui-icon ui-icon-triangle-1-se');
            $(this).find("td.dgrid-column-0-1").html('');
        }

        if ($(this).next('.dgrid-tree-container').hasClass('forcedHide')) {
            $(this).next('.dgrid-tree-container').attr('style', 'display: block; height: auto;').removeClass('forcedHide');
        } else {
            $(this).next('.dgrid-tree-container').attr('style', 'display: block; height: 0px;').addClass('forcedHide');
        }

        //$(this).nextUntil('.dgrid-tree-container > .dgrid-row').slideToggle(100); // Collapse rows
    });

})();