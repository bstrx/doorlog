        $(function() {
                var elements = $('.timer');
                elements.each( function() {
                    setDate(this)
                });

                if (elements.length) {
                    setInterval( function() {
                        elements.each( function() {
                            setDate(this)
                        })
                    }, 1000);
                }
        });

        function setDate(element) {
            var unixtime = $(element).attr('data-unixtime') | 0;
            var h = Math.floor(unixtime / 3600);
            var m = Math.floor(unixtime % 3600 / 60);
            var s = Math.floor(unixtime % 3600 % 60);

            if (h < 10) h = '0' + h;
            if (m < 10) m = '0' + m;
            if (s < 10) s = '0' + s;

            $(element).text(h + ' ч ' + m + ' м ' + s + ' c');
            $(element).attr('data-unixtime', ++unixtime)
        }

        $(function() {
            $('#datepicker').datepicker({
                showOn: 'both',
                buttonImage: "assets/images/calendar.png",
                buttonImageOnly: true,
                dateFormat: "dd-mm-yy",
                autoSize: true,
                firstDay: 1,
                dayNamesMin: ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
                yearRange: "c-1:c",
                maxDate: "c",
                defaultDate: new Date('{$date}'),
                monthNames: ['Январь','Февраль','Март','Апрель','Май','Июнь', 'Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь'],
                onSelect: function (dateText, inst) {
                    $(this).parent('form').submit();
                }
            });

            $('.right-calendar span').on('click', function () {
                $('#datepicker').datepicker("show");
            });
        });