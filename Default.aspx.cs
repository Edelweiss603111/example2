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

        var xmlDocument = new XmlDocument();
        xmlDocument.Load(Server.MapPath("data\\counter.xml"));

        var address = File.ReadAllLines(Server.MapPath("data\\addr.txt"));
        var addrHashSet = new HashSet<string>(address);
        bool isExist = addrHashSet.Contains(Request.UserHostAddress);
        int counter = int.Parse(xmlDocument.DocumentElement.FirstChild.Value);
        if (!isExist)
        {
            counter++;
            File.AppendAllText(Server.MapPath("data\\addr.txt"), Request.UserHostAddress);
        }
        xmlDocument.DocumentElement.FirstChild.Value = counter.ToString();
        xmlDocument.Save(Server.MapPath("data\\counter.xml"));
        counterLabel.Text = counter.ToString();
        var opinion = File.ReadAllLines(Server.MapPath("data\\comments.txt"));

        for (var i = 0; i < opinion.Length; i++)
        {
            var label = new Label();
            label.Text = opinion[i];
            Panel1.ContentTemplateContainer.Controls.Add(label);
            Panel1.ContentTemplateContainer.Controls.Add(new LiteralControl("<br>"));
        }
        textInputField.Text = string.Empty;
    }
}
