<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestForm.aspx.cs" Inherits="Presentation.Website.APIServices.TestForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demo</title>
      <link href="content/styles.css" rel="stylesheet" />
  <%--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>--%>

<!-- Optional theme -->
<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"/> --%>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>--%>
</head>
<body>
    <form id="form1" runat="server">
    <div>

  
       

         <div id="form_Dialog_NumberLists_Search_parameters"   width:100%;'>                     
                    <table style="align-content:center"   >
                            <tr>                                                              
                                <td style="align-content:center"   >   
                                    <table style="align-content:center" >
                                        <tr>
                                            <td>                 * Destination :</td>
                                            <td>
                                                <input 
                                                id="TextDestinationCode"   name="searchterm" 
                                                type="text"                           
                                                  /> <span class="loading"></span>
                                            </td>
                                        </tr>
                  
                                    </table>                          
                                </td> 
                            </tr>
                        </table> 
             
                                                    
                </div>
 

    </div>
    </form>
</body>
</html>
<%--<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">--%>

<!-- Latest compiled and minified JavaScript -->
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>--%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script><script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script> 
<style>
		.loading {
			display: none;
			width: 16px;
			height: 16px;
			background-image: url(loading.gif);
			vertical-align: text-bottom;
		}
		/* autocomplete adds the ui-autocomplete-loading class to the textbox when it is _busy_, use general sibling combinator ingeniously */
		#autocomplete.ui-autocomplete-loading ~ .loading {
			display: inline-block;
		}
		.ui-autocomplete .m-name {
			margin-right: 1em;
			font-size: larger;
		}
		.ui-autocomplete .m-year {
			float: right;
			font-size: larger;
		}
		.ui-autocomplete .m-cast {
			display: block;
			font-size: smaller;
		}
		/* Rotten Tomatoes Branding */
		.ui-autocomplete .rt-main {
			display: block;
			margin-left: 1em;
			font-size: smaller;
		}
		.ui-autocomplete .rt-ico {
			display: inline-block;
			margin-right: .5em;
			width: 16px;
			height: 16px;
			background-image: url(rt-icons.png);
			vertical-align: bottom;
		}
		.ui-autocomplete .rt-ico.fresh {
			background-position: 0 0;
		}
		.ui-autocomplete .rt-ico.rotten {
			background-position: -16px 0;
		}
		.ui-autocomplete .rt-ico.certified_fresh {
			background-position: -32px 0;
		}
		.ui-autocomplete .rt-val {
			display: inline-block;
			margin-right: .5em;
		}
		.ui-autocomplete .rt-bar {
			display: inline-block;
			margin-right: .5em;
			width: 10em;
			height: 1em;
			background-color: #ECE4B5;
		}
		.ui-autocomplete .rt-bar span {
			display: block;
			height: 1em;
		}
		.ui-autocomplete .rt-bar.fresh span, .ui-autocomplete .rt-bar.certified_fresh span {
			background-color: #C91B22;
		}
		.ui-autocomplete .rt-bar.rotten span {
			background-color: #94B13C;
		}
	</style>
<script>
 
    $(document).ready(function () {
        $("#TextDestinationCode").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "/api/AutoCompleter/GetHotelDestinations",
                    type: "GET",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data:

     {
         searchterm: $('#TextDestinationCode').val(),

     },
                  
                    success: function (data) {
                        
                        response($.map(data, function (item) {
                            return { value: item.dest };
                        }))

                    }
                })
            },
            selectFirst: true,
            minLength: 1,
            select: function (event, ui) {
               
                alert(ui.item.label);
                //log(ui.item ?
                //  "Selected: " + ui.item.label :
                //  "Nothing selected, input was " + this.value);
            },
            focus: function (event, ui) {
                if (ui.item.loading) {
                    event.preventDefault();
                }
            },
            onHint: function (hint) {
                debugger;
                $('#TextDestinationCode').val(hint);
            },
            open: function () {
                $(this).removeClass("ui-corner-all").addClass("ui-corner-top");
            },
            close: function () {
                $(this).removeClass("ui-corner-top").addClass("ui-corner-all");
            }
        });
    });

    $.ui.autocomplete.prototype._renderItem = function (ul, item) {
        var term = this.term.split(' ').join('|');
        var re = new RegExp("(" + term + ")", "gi");
        var t = item.label.replace(re, "<b>$1</b>");
        return $("<li></li>")
           .data("item.autocomplete", item)
           .append("<a>" + t + "</a>")
           .appendTo(ul);
    };

    //$(document).ready(function () {
    //    //getHotelData();
    //  //  ping("I am responsive");
    //});
    
    //function getHotelData()
    //{
    //    $.ajax(
    //    {
    //        url: "api/AutoCompleter/GetHotelDestinations",
    //        type: "GET",
    //        contentType: "application/json",
    //        data: 
   
    //           {   searchterm: $('#TextDestinationCode').val(),
                
    //        },
    //        success: function (result) {

    //            var container = $("#TableNumberLists");

    //            $(container).find("tr:gt(0)").remove();

    //            var formattedLists = " <tr>                                <th style='text-align:left;'>                                    Hotel Code                                </th>                          </tr>";

    //            $.each(result, function () {
                    
    //                formattedLists  +="<tr>";

    //                formattedLists  += "<td  style='text-align:left;'>";
    //                formattedLists += this.dest;
    //                formattedLists  +="</td>";

                  


    //                formattedLists  +="</tr>";
    //            });

    //            $(container).html(formattedLists);
                
    //        },
    //        error: function (xhr, status, p3, p4) {
    //            var err = "Error " + " " + status + " " + p3;
    //            if (xhr.responseText && xhr.responseText[0] == "{")
    //                err = JSON.parse(xhr.responseText).Message;
    //            alert(err);
    //        }
    //    });
    //}

    function ping(str) {
        $.ajax(
        {
            url: "api/AutoCompleter/Ping",
            type: "GET",
            contentType: "application/json",
            data: { pingString: str },
            success: function (result) {
                alert(result);
            },
            error: function (xhr, status, p3, p4) {
                var err = "Error " + " " + status + " " + p3;
                if (xhr.responseText && xhr.responseText[0] == "{")
                    err = JSON.parse(xhr.responseText).message;
                alert(err);
            }
        });
    }



    /***********/
    
</script>