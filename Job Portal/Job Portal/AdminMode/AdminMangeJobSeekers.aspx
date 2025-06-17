<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminMangeJobSeekers.aspx.cs" Inherits="Job_Portal.AdminMod.AdminMangeJobSeekers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

           <table>
    <tr>
        <td>
        <asp:GridView ID="gvjobshow" runat="server" OnRowCommand="gvjobshow_RowCommand"  AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">

            <AlternatingRowStyle BackColor="#DCDCDC" />

            <Columns>
              <asp:TemplateField HeaderText="ID">
            <ItemTemplate>
                <%# Eval("JobSeekerId") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                <%# Eval("JobSeekerName") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Email">
            <ItemTemplate>
                <a href='mailto:<%# Eval("JobSeekerEmail") %>'><%# Eval("JobSeekerEmail") %></a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Image Path">
    <ItemTemplate>
       <asp:Image ID="imgjobseeker" runat="server" Width="50" Height="50" ImageUrl='<%#Eval("JobSeekerImage","~/Jobseekar_Photos/{0}") %>' />
    </ItemTemplate>
</asp:TemplateField>
        
        <asp:TemplateField HeaderText="Gender">
            <ItemTemplate>
                <%# Eval("JobSeekerGender").ToString() == "1" ? "Male" : Eval("JobSeekerGender").ToString() == "2" ? "Female" : "Other" %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Job Profile ID">
            <ItemTemplate>
                <%# Eval("JobSeekerJobProfile") %>
            </ItemTemplate>
        </asp:TemplateField>

        
        <asp:TemplateField HeaderText="Qualification ID">
            <ItemTemplate>
                <%# Eval("JobSeekerQualification") %>
            </ItemTemplate>
        </asp:TemplateField>

       
        <asp:TemplateField HeaderText="Date of Birth">
            <ItemTemplate>
                <%# Convert.ToDateTime(Eval("JobSeekerDOB")).ToString("dd-MM-yyyy") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Mobile">
            <ItemTemplate>
                <%# Eval("JobSeekerMobile") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Experience (Years)">
            <ItemTemplate>
                <%# Eval("JobSeekerExp") %>
            </ItemTemplate>
        </asp:TemplateField>
            <asp:TemplateField HeaderText="Address">
     <ItemTemplate>
         <%# Eval("JobSeekerAddress") %>,<%#Eval("JobSeekerCity") %>,<%#Eval("JobSeekerState") %>
     </ItemTemplate>
 </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Comments">
            <ItemTemplate>
                <%# Eval("JobSeekerComments") %>
            </ItemTemplate>
        </asp:TemplateField>

        
       <asp:TemplateField HeaderText="Status">
    <ItemTemplate>
        <%# Eval("JobSeekerStatus") %>
    </ItemTemplate>
</asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate> 
                <asp:Button ID ="btnblock" runat="server" Text='<%#Eval("JobSeekerStatus").ToString()=="0"? "Active" :"Blocked" %>' CommandName="B" CommandArgument='<%#Eval("JobSeekerId")%>' />
            </ItemTemplate>
        </asp:TemplateField>


            </Columns>


            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />


        </asp:GridView>
        </td>
    </tr>
</table>

</asp:Content>
