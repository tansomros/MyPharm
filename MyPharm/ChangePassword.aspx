 
<%@ Page Title="����¹���ʼ�ҹ" Language="vb" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ChangePassword.aspx.vb" Inherits="CPA.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-874" />    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      <div class="app-page-title">
                        <div class="page-title-wrapper">
                            <div class="page-title-heading">
                                <div class="page-title-icon">
                                    <i class="pe-7s-light icon-gradient bg-mean-fruit"></i>
                                </div>
                                <div>����¹���ʼ�ҹ
                                    <div class="page-title-subheading"></div>
                                </div>
                            </div>
                        </div>
                    </div>    

<section class="content">             
    <asp:Panel ID="pnForm" runat="server">
 <div class="box box-solid">
            <div class="box-header">
              <i class="fa fa-info-circle"></i>
              <h3 class="box-title">����¹���ʼ�ҹ</h3>                   
            </div>
            <div class="box-body">
 
 <table border="0" align="center" cellpadding="2" cellspacing="2">
  <tr>
    <td>���ʼ�ҹ��� :</td>
    <td>
        <asp:TextBox ID="txtOld" runat="server" Width="200px" CssClass="form-control" TextMode="Password"></asp:TextBox>      </td>
  </tr>
  <tr>
    <td>���ʼ�ҹ���� :</td>
    <td>
        <asp:TextBox ID="txtNew" runat="server" Width="200px"  CssClass="form-control"  TextMode="Password"></asp:TextBox>      </td>
  </tr>
  <tr>
    <td>�׹�ѹ���ʼ�ҹ�����ա���� :</td>
    <td>
        <asp:TextBox ID="txtRe" runat="server" Width="200px"  CssClass="form-control" TextMode="Password"></asp:TextBox></td>
  </tr>
     <tr>
         <td colspan="2">&nbsp;</td>
     </tr>
  <tr>
    <td colspan="2" align="center">
        <asp:Button ID="cmdSave"    runat="server" Text="�ѹ�֡����¹���ʼ�ҹ" cssclass="btn btn-primary"  /> 
    </td>
    </tr>
</table>

            </div>
          
          </div>
    </asp:Panel>     
     <asp:Panel ID="pnResult" runat="server"  >
     <table border="0" cellpadding="0" cellspacing="2" width="90%">
                            <tr>
                                <td align="center">
                                    �к�����¹���ʼ�ҹ����ҹ�������º��������
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    㹡������к����駵��价�ҹ��ͧ������ʼ�ҹ����㹡������к�</td>
                            </tr>
                             <tr>
          <td >              &nbsp;</td>
        </tr>

                        </table>
                        



                    </asp:Panel>
      </section>
</asp:Content>
