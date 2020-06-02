<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Horario.aspx.cs" Inherits="HiperPatagonico1.Horario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       
		<script type="text/javascript" src="Scripts/WebForms/redips-drag-min.js"></script>
		<script type="text/javascript" src="Scripts/WebForms/scripto.js"></script>
		
    <style>
		
/* drag container */
#main_container {
    margin: auto;
    width: 730px;
	margin-top:5%;
}
    /* container for the left table */
    #main_container #left {
        width: 130px;
        height: 320px;
        float: left;
        margin-right: 20px;
    }
    /* container for the main table and message line below */
    #main_container #right {
        width: 675px;
        padding-left: auto;
        padding-right: 0px;
        /* align div to the right */
        margin-left: auto;
    }


/* drag objects (DIV inside table cells) */
.redips-drag {
    cursor: move;
    margin: auto;
    z-index: 10;
    color: #222;
    text-align: center;
    font-size: 10pt; /* needed for cloned object */
    opacity: 0.7;
    filter: alpha(opacity=70);
    /* without width, IE6/7 will not apply filter/opacity to the element ?! */
    /* IE needs element layout */
    width: 87px;
    height: 20px;
    line-height: 20px;
    /* border */
    border: 1px solid #555;
    /* round corners */
    border-radius: 3px;
    -moz-border-radius: 3px; /* FF */
}


/* tables */
div#redips-drag table {
    background-color: #e4e4e4;
    border-collapse: collapse;
}
/* timetable */
div#drag #table2 {
    /* align table to the right */
    margin-left: auto;
}


/* table cells */
div#redips-drag td {
    border-style: solid;
    border-width: 1px;
    border-color: white;
    height: 32px;
    text-align: center;
    font-size: 10pt;
    padding: 2px;
}
/* overwrite border settings for left tables */
/* set all borders to 0px except border-bottom */
div#redips-drag #table1 td {
    border-width: 0px 0px 1px 0px;
}
/* styles for clone DIV elements in left table */
div#redips-drag #table1 div {
    margin-left: 5px;
    float: left;
}
/* define styles for buttons */
div#redips-drag #table1 input {
    float: right;
    width: 15px;
    height: 23px;
    margin-right: 5px;
    border-width: 1px;
    /* round corners */
    border-radius: 3px;
    /* default visibility is hidden */
    visibility: hidden;
}


/* subject colors */
.ar {
    background-color: #AAC8E2;
}

.bi {
    background-color: #E7D783;
}

.ch {
    background-color: #E99AE6;
}

.en {
    background-color: #C4AFFF;
}

.et {
    background-color: #91DEC5;
}

.hi {
    background-color: #CFE17F;
}

.it {
    background-color: #E7BD83;
}

.ma {
    background-color: #FFC5C2;
}

.ph {
    background-color: #A5F09D;
}


/* blank cells (upper left corner) */
.blank {
    background-color: white;
}


/* background color for lunch */
.lunch {
    color: #665;
    background-color: #f8eeee;
}


/* trash cell */
.redips-trash {
    color: white;
    background-color: #6386BD;
}


/* message line */
#message {
    color: white;
    background-color: #aaa;
    text-align: center;
    margin-top: 10px;
}


/* dark cells (first column and table header) */
.dark {
    color: #444;
    background-color: #e0e0e0;
}

.button_container {
    padding-top: 10px;
    text-align: right;
}

    /* "Save" button */
    .button_container input {
        background-color: #6A93D4;
        color: white;
        border-width: 1px;
        width: 40px;
        padding: 0px;
    }

    </style>
		<div id="main_container">
			<!-- tables inside this DIV could have draggable content -->
			<div id="redips-drag">
	
				<!-- left container (table with subjects) -->
				<div id="left">
					<table id="table1">
						<colgroup>
							<col width="190"/>
						</colgroup>
						<tbody>
							<tr><td class="dark"><div id="ar" class="redips-drag redips-clone ar">Candy 69</div><input id="b_ar" class="ar" type="button" value="" onclick="redips.report('ar')" title="Show only Arts"/></td></tr>
							<tr><td class="dark"><div id="bi" class="redips-drag redips-clone bi">vicente t/33</div><input id="b_bi" class="bi" type="button" value="" onclick="redips.report('bi')" title="Show only Biology"/></td></tr>
							<tr><td class="dark"><div id="ch" class="redips-drag redips-clone ch">Chemistry</div><input id="b_ch" class="ch" type="button" value="" onclick="redips.report('ch')" title="Show only Chemistry"/></td></tr>
							<tr><td class="dark"><div id="en" class="redips-drag redips-clone en">English</div><input id="b_en" class="en" type="button" value="" onclick="redips.report('en')" title="Show only English"/></td></tr>
							<tr><td class="dark"><div id="et" class="redips-drag redips-clone et">Ethics</div><input id="b_et" class="et" type="button" value="" onclick="redips.report('et')" title="Show only Ethics"/></td></tr>
							<tr><td class="dark"><div id="hi" class="redips-drag redips-clone hi">History</div><input id="b_hi" class="hi" type="button" value="" onclick="redips.report('hi')" title="Show only History"/></td></tr>
							<tr><td class="dark"><div id="it" class="redips-drag redips-clone it">IT</div><input id="b_it" class="it" type="button" value="" onclick="redips.report('it')" title="Show only IT"/></td></tr>
							<tr><td class="dark"><div id="ma" class="redips-drag redips-clone ma">Mathematics</div><input id="b_ma" class="ma" type="button" value="" onclick="redips.report('ma')" title="Show only Mathematics"/></td></tr>
							<tr><td class="dark"><div id="ph" class="redips-drag redips-clone ph">Physics</div><input id="b_ph" class="ph" type="button" value="" onclick="redips.report('ph')" title="Show only Physics"/></td></tr>
							<tr><td class="redips-trash" title="Trash">Basurero</td></tr>
						</tbody>
					</table>
				</div><!-- left container -->
				
				<!-- right container -->
				<div id="right">
					<table id="table2">
						<colgroup>
							<col width="50"/>
							<col width="100"/>
							<col width="100"/>
							<col width="100"/>
							<col width="100"/>
							<col width="100"/>
						</colgroup>
						<tbody>
							<tr>
								<!-- if checkbox is checked, clone school subjects to the whole table row  -->
								<td class="redips-mark blank">
									<input id="week" type="checkbox" title="Apply school subjects to the week" checked/>
									<input id="report" type="checkbox" title="Show subject report"/>
								</td>
								<td class="redips-mark dark">Lunes</td>
								<td class="redips-mark dark">Martes</td>
								<td class="redips-mark dark">Miercoles</td>
								<td class="redips-mark dark">Jueves</td>
								<td class="redips-mark dark">Viernes</td>
								<td class="redips-mark dark">Sabado</td>
								<td class="redips-mark dark">Domingo</td>

							</tr>
							<tr>
								<td class="redips-mark dark">8:00</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>


							</tr>
							<tr>
								<td class="redips-mark dark">9:00</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>

							</tr>
							<tr>
								<td class="redips-mark dark">10:00</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>

							</tr>
							<tr>
								<td class="redips-mark dark">11:00</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>


							</tr>
							<tr>
								<td class="redips-mark dark">12:00</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>

							</tr>
							<tr>
								<td class="redips-mark dark">13:00</td>
								<td class="redips-mark lunch" colspan="7">Colacion</td>
							</tr>
							<tr>
								<td class="redips-mark dark">14:00</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>

							</tr>
							<tr>
								<td class="redips-mark dark">15:00</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>

							</tr>
							<tr>
								<td class="redips-mark dark">16:00</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>

							</tr>
						</tbody>
					</table>
				</div><!-- right container -->
			</div><!-- drag container -->
			
		</div>
</asp:Content>
