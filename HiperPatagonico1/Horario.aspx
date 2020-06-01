<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Horario.aspx.cs" Inherits="HiperPatagonico1.Horario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <script type="text/javascript" charset="utf8" src="https://johnny.github.io/jquery-sortable/js/jquery-sortable.js"></script>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
      #sortable1, #sortable2 {
    border: 1px solid #eee;
    width: 142px;
    min-height: 20px;
    list-style-type: none;
    margin: 0;
    padding: 5px 0 0 0;
    float: left;
    margin-right: 10px;
    background-color:aqua;
     }
     #sortable1 li, #sortable2 li {
    margin: 0 5px 5px 5px;
    padding: 5px;
    font-size: 1.2em;
    width: 120px;
  }
  </style>
    <ul id="sortable1" class="connectedSortable">
        <li class="ui-state-default">vicente t/33</li>
        <li class="ui-state-default">marduk t/69</li>
        <li class="ui-state-default">Item 3</li>
        <li class="ui-state-default">Item 4</li>
        <li class="ui-state-default">Item 5</li>
    </ul>

    <ul id="sortable2" class="connectedSortable">
        <li class="ui-state-highlight">Item 1</li>
        <li class="ui-state-highlight">Item 2</li>
        <li class="ui-state-highlight">Item 3</li>
        <li class="ui-state-highlight">Item 4</li>
        <li class="ui-state-highlight">Item 5</li>
    </ul>
  
    <script>
        $(function () {
            $("#sortable1, #sortable2").sortable({
                connectWith: ".connectedSortable"
            }).disableSelection();
        });
    </script>
</asp:Content>
