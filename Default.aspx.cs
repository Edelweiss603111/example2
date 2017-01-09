using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Text;
using System.IO;


public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [System.Web.Services.WebMethod]
    public static string SendOpinion(string opinionText)
    {
        if (opinionText != "")
        {
            var opinion = "\n" + DateTime.Now.ToString("dd MMMM yyyy  |  HH:mm:ss") + "  Отзыв: ";
            opinion += System.Net.WebUtility.HtmlEncode(opinionText);
            var page = new Page();
            File.AppendAllText(page.Server.MapPath("~/data/comments.txt"), opinion);
            return opinion;
        }
        return opinionText;
    }
}
