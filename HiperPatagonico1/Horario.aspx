﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Horario.aspx.cs" Inherits="HiperPatagonico1.Horario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       
	    <link href="fullcalendar1/main.css" rel='stylesheet' />
        <script src="fullcalendar1/main.min.js"></script>
        <script src="fullcalendar1/locales-all.js"></script>
        <script>

            document.addEventListener('DOMContentLoaded', function () {

                /* initialize the external events
                -----------------------------------------------------------------*/

                var containerEl = document.getElementById('external-events-list');
                new FullCalendar.Draggable(containerEl, {
                    itemSelector: '.fc-event',
                    eventData: function (eventEl) {
                        return {
                            title: eventEl.innerText.trim()
                        }
                    }
                });

                //// the individual way to do it
                // var containerEl = document.getElementById('external-events-list');
                // var eventEls = Array.prototype.slice.call(
                //   containerEl.querySelectorAll('.fc-event')
                // );
                // eventEls.forEach(function(eventEl) {
                //   new FullCalendar.Draggable(eventEl, {
                //     eventData: {
                //       title: eventEl.innerText.trim(),
                //     }
                //   });
                // });

                /* initialize the calendar
                -----------------------------------------------------------------*/

                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {

                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                    },

                    editable: true,
                    droppable: true, // this allows things to be dropped onto the calendar
                    drop: function (arg) {
                        // is the "remove after drop" checkbox checked?
                        if (document.getElementById('drop-remove').checked) {
                            // if so, remove the element from the "Draggable Events" list
                            arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                        }
                    },
                    locale: 'es'
                });
                calendar.render();
                calendar.setOption('locale', 'es');
            });

</script>
<style>

  body {
    margin-top: 40px;
    font-size: 14px;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  }

  #external-events {
    position: fixed;
    left: 20px;
    top: 40px;
    width: 150px;
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #eee;
    text-align: left;
  }

  #external-events h4 {
    font-size: 16px;
    margin-top: 0;
    padding-top: 1em;
  }

  #external-events .fc-event {
    margin: 3px 0;
    cursor: move;
  }

  #external-events p {
    margin: 1.5em 0;
    font-size: 11px;
    color: #666;
  }

  #external-events p input {
    margin: 0;
    vertical-align: middle;
  }

  #calendar-wrap {
    margin-left: 200px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
<body>
              <div id='wrap'>
                <div id='external-events' style="margin-top:2%">
                  <h4>Empleados</h4>

                  <div id='external-events-list'>


                      <asp:Repeater ID="RepeaterEmp" runat="server" >
                                <ItemTemplate>
                                    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                                      <div class='fc-event-main'><%# Eval("empleado.nombre")%> <%# Eval("empleado.apellido")%> /  <%# Eval("turno.codigo")%></div>
                                    </div>
                               </ItemTemplate>
                            </asp:Repeater> 
                  </div>

                  <p>
                    <input type='checkbox' id='drop-remove' />
                    <label for='drop-remove'>remover los turnos despues</label>
                  </p>
                </div>
                  
                <div class="jumbotron" id='calendar-wrap'>
                  <div id='calendar'></div>
                </div>

              </div>
</body>
</asp:Content>

