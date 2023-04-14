<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Graph.aspx.cs" Inherits="PruebasParaTodo_Graph" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'How Much Pizza I Ate Last Night',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" Runat="Server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">


  <%--BackColor="0, 0, 64"--%>
  <%--BorderlineColor="64, 0, 64"--%>
    <%--Width="380px"--%>
     <asp:Chart ID="Chart1" 
        runat="server" 
        BackGradientStyle="LeftRight"  
        BorderlineWidth="0"
        Height="360px"
        Palette="None"
        PaletteCustomColors="Maroon"  
        Width="380px"
        
         >  
        <Titles>  
            <asp:Title ShadowOffset="10" Name="Items" />  
        </Titles>  
        <Legends>  
            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"  
                LegendStyle="Row" />  
        </Legends>  
        <Series>  
            <asp:Series Name="Default" />  
        </Series>  
        <ChartAreas>  
            <asp:ChartArea Name="ChartArea1" BorderWidth="0" />  
        </ChartAreas>  
         

    </asp:Chart>  

    <br />
    <br />
    <br />
    <br /> <div id="chart_div"></div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" Runat="Server">
</asp:Content>

