<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminMangeJobRecuriters.aspx.cs" Inherits="Job_Portal.AdminMod.AdminMangeJobRecuriters" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


       <table>
    <tr>
        <td>
        <asp:GridView ID="gvjobshow" runat="server" OnRowCommand="gvjobshow_RowCommand" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">

            <AlternatingRowStyle BackColor="#DCDCDC" />

            <Columns>
             <asp:TemplateField HeaderText="Recruiter ID">
            <ItemTemplate>
                <%# Eval("JobRecruiterId") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                <%# Eval("JobRecruiterName") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Email">
            <ItemTemplate>
                <%# Eval("JobRecruiterEmail") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Password">
            <ItemTemplate>
                <%# Eval("JobRecruiterPassword") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Company URL">
            <ItemTemplate>
                <%# Eval("JobRecruiterURL") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="State ID">
            <ItemTemplate>
                <%# Eval("JobRecruiterState") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="City ID">
            <ItemTemplate>
                <%# Eval("JobRecruiterCity") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Address">
            <ItemTemplate>
                <%# Eval("JobRecruiterAddress") %>,<%#Eval("CityName") %>,<%#Eval("StateName") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="HR Name">
            <ItemTemplate>
                <%# Eval("JobRecruiterHR") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Mobile Number">
            <ItemTemplate>
                <%# Eval("JobRecruiterMobile") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Image Path">
            <ItemTemplate>
               <asp:Image ID="imgrecruiter" runat="server" Width="50" Height="50" ImageUrl='<%#Eval("JobRecruiterImage","~/JobRecruiter_Images/{0}") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Comments">
            <ItemTemplate>
                <%# Eval("JobRecruiterComments") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Inserted Date">
            <ItemTemplate>
                <%# Eval("JobRecruiterInsertedDate", "{0:yyyy-MM-dd}") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                <%# Eval("JobRecruiterStatus") %>
            </ItemTemplate>
        </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate> 
                        <asp:Button ID ="btnblock" runat="server" Text='<%# Eval("JobRecruiterStatus").ToString()=="0"? "Active" :"Blocked" %>' CommandName="B" CommandArgument='<%# Eval("JobRecruiterId") %>' />
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
