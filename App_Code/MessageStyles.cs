using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de MessageStyles
/// </summary>
public class MessageStyles
{
	public MessageStyles()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

	public static string Success(string message, bool dimiss) { return String.Format("<div class=\"alert alert-success {0}\">{1} {2}</div>", dimiss ? "alert-dismissable" : "", dimiss ? "<button  type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" : "", message.Replace("<br />", "")); }
	public static string Info(string message, bool dimiss) { return String.Format("<div class=\"alert alert-info {0}\">{1} {2}</div>", dimiss ? "alert-dismissable" : "", dimiss ? "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" : "", message.Replace("<br />", "")); }
	public static string Warning(string message, bool dimiss) { return String.Format("<div class=\"alert alert-warning {0}\">{1} {2}</div>", dimiss ? "alert-dismissable" : "", dimiss ? "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" : "", message.Replace("<br />", "")); }
	public static string Danger(string message, bool dimiss) { return String.Format("<div class=\"alert alert-danger {0}\">{1} {2}</div>", dimiss ? "alert-dismissable" : "", dimiss ? "<button  type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" : "", message.Replace("<br />", "")); }

}