/**
 * Created by Htang on 6/30/2015.
 */
(function ($) {
    $.widget("custom.combobox", {
        _create: function () {
            this.wrapper = $("<span>")
                .addClass("custom-combobox")
                .insertAfter(this.element);

            this.element.hide();
            this._createAutocomplete();
            this._createShowAllButton();
        },

        _createAutocomplete: function () {
            var selected = this.element.children(":selected"),
                value = selected.val() ? selected.text() : "";

            this.input = $("<input>")
                .appendTo(this.wrapper)
                .val(value)
                .attr("title", "")
                .addClass("custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left")
                .autocomplete({
                    delay: 0,
                    minLength: 0,
                    source: $.proxy(this, "_source")
                })
                .tooltip({
                    tooltipClass: "ui-state-highlight"
                });

            this._on(this.input, {
                autocompleteselect: function (event, ui) {
                    ui.item.option.selected = true;
                    this._trigger("select", event, {
                        item: ui.item.option
                    });
                },

                autocompletechange: "_removeIfInvalid"
            });
        },

        _createShowAllButton: function () {
            /*var input = this.input,
                wasOpen = false;

            $("<a>")
                .attr("tabIndex", -1)
                .attr("title", "Hiện tất cả")
                .tooltip()
                .appendTo(this.wrapper)
                .button({
                    icons: {
                        primary: "ui-icon-triangle-1-s"
                    },
                    text: false
                })
                .removeClass("ui-corner-all")
                .addClass("custom-combobox-toggle ui-corner-right")
                .mousedown(function () {
                    wasOpen = input.autocomplete("widget").is(":visible");
                })
                .click(function () {
                    input.focus();

                    // Close if already visible
                    if (wasOpen) {
                        return;
                    }

                    // Pass empty string as value to search for, displaying all results
                    input.autocomplete("search", "");
                });*/
        },

        _source: function (request, response) {
            $('#search').removeAttr('disabled');
            $("#search").attr('class', 'btn btn-primary');
            var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
            response(this.element.children("option").map(function () {
                var text = $(this).text();
                if (this.value && ( !request.term || matcher.test(text) ))
                    return {
                        label: text,
                        value: text,
                        option: this
                    };
            }));
        },

        _removeIfInvalid: function (event, ui) {
            // Selected an item, nothing to do
            if (ui.item) {
                return;
            }

            // Search for a match (case-insensitive)
            var value = this.input.val(),
                valueLowerCase = value.toLowerCase(),
                valid = false;
            this.element.children("option").each(function () {
                if ($(this).text().toLowerCase() === valueLowerCase) {
                    this.selected = valid = true;
                    return false;
                }
            });

            // Found a match, nothing to do
            if (valid) {
                return;
            }

            // Remove invalid value
            this.input
                .attr("title", value + " không tồn tại!")
                .tooltip("open");
            $('#search').attr('disabled','disabled');
            $("#search").attr('class', 'btn btn-gray');
            this.element.val("");
            this._delay(function () {
                this.input.tooltip("close").attr("title", "");
            }, 2500);
            this.input.autocomplete("instance").term = "";
        },

        _destroy: function () {
            this.wrapper.remove();
            this.element.show();
        }
    });
})(jQuery);
$(function () {
    $("#combobox1").combobox();
    $("#combobox2").combobox();
    $("#all").combobox();
    $("#avai").combobox();
    $("#ui-username").combobox();

});
$(function () {
    $("#datepickerFrom").datepicker({dateFormat: "yy-mm-dd"});
    $("#datepickeTo").datepicker({dateFormat: "yy-mm-dd"});
    $("#datefrom").datepicker({dateFormat: "yy-mm-dd"});
    $("#dateto").datepicker({dateFormat: "yy-mm-dd"});
});

setInterval(function() {
    if($("#teacherBox > span > input").val()=="" && $("#selectSearch").selectedIndex==0){
        $('#search').removeAttr('disabled');
        $("#search").attr('class', 'btn btn-primary');
    }
    if($("#classroomBox > span > input").val()=="" && $("#selectSearch").selectedIndex==1){
        $('#search').removeAttr('disabled');
        $("#search").attr('class', 'btn btn-primary');
    }
}, 100);
