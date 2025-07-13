﻿<%@ Page Title="" Language="vb" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="GPP.aspx.vb" Inherits="CPA.GPP" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">     
        <script type="text/javascript">
       function openModalUpload(sender,id) { 
           $('#modal-window-upl').modal('show');
           return false;
       }
    
        </script>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="app-page-title">
            <div class="page-title-wrapper">
                <div class="page-title-heading">
                    <div class="page-title-icon">
                        <i class="pe-7s-home icon-gradient bg-green"></i>
                    </div>
                    <div>ส่วนที่ 2 : การตรวจ GPP
                        <div class="page-title-subheading">(หากมีข้อมูล ในระบบ Skynet แล้ว ไม่ต้องประเมินส่วนนี้)
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="content">
            <section class="col-lg-12">
                <div class="app-page-header">
                    <div class="page-title-wrapper">
                        <div class="page-title-heading">
                            <div class="text-red">หมายเหตุ : รายการตรวจที่มีสีแดง คือ รายการตรวจประเภท Critical
                                <div class="page-title-subheading">
                                    <asp:HiddenField ID="hdLocationUID" runat="server" />
                                    <asp:HiddenField ID="hdRequestUID" runat="server" />
                                    <asp:HiddenField ID="hdGPPUID" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section> 
                    
              
            <div class="row">
                <section class="col-lg-12 connectedSortable">

  <asp:UpdatePanel ID="UpdatePanelGPP" runat="server">
                                <ContentTemplate> 
                                     <div class="box box-solid">
            <div class="box-header">1.สถานที่ขายยาแผนปัจจุบัน
                <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>                                 
            </div> 
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12 table-responsive">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>

                                                <th class="text-center" width="40">ไฟล์แนบ</th>
                                                <th class="text-center" width="1000">สิ่งที่ต้องตรวจสอบ</th>
                                                <th class="text-center" width="300">ระดับคะแนน</th>
                                                <th class="text-center">ค่าถ่วงน้ำหนัก</th>
                                                <th class="text-center">คะแนนที่ได้</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="text-center">
                                                     <asp:LinkButton ID="imgS1Q1" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton>                                   
                                                </td>
                                                <td class="text-red">

                                                    ข้อที่ 1.1 สถานที่ขายยาแผนปัจจุบัน
                                                    ต้องมีพื้นที่ขายให้คำปรึกษาและแนะนำการใช้ยา ติดต่อกันขนาดไม่น้อยกว่า
                                                    8 ตารางเมตรทั้งนี้ไม่รวมถึงพื้นที่เก็บสำรองยา
                                                    โดยความยาวของด้านที่สั้นที่สุดของพื้นที่ต้องไม่น้อยกว่า 2 เมตร
                                                    (Critical Defect)
                                                </td>
                                                <td>

                                                    <asp:RadioButtonList ID="optS1Q1" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border" AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                                <td class="text-center">2</td>
                                                <td class="text-center">
                                                    <asp:Label ID="lblScoreS1Q1" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-center">
                                                   <asp:LinkButton ID="imgS1Q2" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 
                                                  </td>
                                                <td>
                                                    ข้อที่ 1.2 หากมีพื้นที่เก็บสำรองยาเป็นการเฉพาะ ต้องมีพื้นที่เพียงพอ
                                                    เก็บอย่างเป็นระเบียบ เหมาะสม และไม่วางยาสัมผัสกับพื้นโดยตรง
                                                </td>
                                                <td> <asp:RadioButtonList ID="optS1Q2" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border" AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                                <td class="text-center">
                                                    1
                                                </td>
                                                <td class="text-center"><asp:Label ID="lblScoreS1Q2" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-center"><asp:LinkButton ID="imgS1Q3" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 
                                                </td>
                                                <td>
                                                    ข้อที่ 1.3 บริเวณสำหรับให้คำปรึกษาและแนะนำการใช้ยา
                                                    ต้องเป็นสัดส่วนแยกออกจากส่วนบริการอื่นอย่างชัดเจน
                                                    มีพื้นที่พอสำหรับการให้คำปรึกาและการจัดเก็บประวัติ
                                                    รวมทั้งจัดให้มีโต๊ะเก้าอี้สำหรับเภสัชกรและผู้มารับคำปรึกษาอยู่ในบริเวณดังกล่าวพร้อมทั้งมีป้ายแสดงชัดเจน
                                                </td>
                                                <td> <asp:RadioButtonList ID="optS1Q3" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                                <td class="text-center">
                                                    1
                                                </td>
                                                <td class="text-center"><asp:Label ID="lblScoreS1Q3" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><asp:LinkButton ID="imgS1Q4" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 
                                                </td>
                                                <td class="text-red">
                                                    ข้อที่ 1.4 สถานที่ขายยาต้องมีความมั่นคง
                                                    มีทะเบียนบ้านที่ออกให้โดยส่วนราชการที่เกี่ยวข้องในกรณีที่เป็นอาคารชุด
                                                    ต้องมีพื้นที่อนุญาตให้ประกอบกิจการไม่ใช่ที่พักอาศัย
                                                    (Critical Defect)
                                                </td>
                                                <td> <asp:RadioButtonList ID="optS1Q4" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                                <td class="text-center">1
                                                </td>
                                                <td class="text-center"> <asp:Label ID="lblScoreS1Q4" runat="server" Text=""></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td><asp:LinkButton ID="imgS1Q5" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 
                                                </td>
                                                <td class="text-red">

                                                    ข้อที่ 1.5 สถานที่ขายยาต้องมีความแข็งแรงก่อสร้างด้วยวัสดุที่คงทนถาวร
                                                    เป็นสัดส่วนชัดเจน (Critical Defect)
                                                </td>
                                                <td>
                                                     <asp:RadioButtonList ID="optS1Q5" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                                </td>
                                                <td class="text-center">
                                                    1
                                                </td>
                                                <td class="text-center"><asp:Label ID="lblScoreS1Q5" runat="server" Text=""></asp:Label>


                                                </td>
                                            </tr>
                                            <tr>
                                                <td><asp:LinkButton ID="imgS1Q6" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 


                                                </td>
                                                <td>

                                                    ข้อที่ 1.6 สถานที่ขายยาต้องถูกสุขลักษณะ สะอาด เป็นระเบียบเรียบร้อย
                                                    มีการควบคุมป้องกันสัตว์แมลงมารบกวน ไม่มีสัตว์เลี้ยงในบริเวณขายขาย
                                                    และอากาศถ่ายเทสะดวก
                                                </td>
                                                <td>
                                                     <asp:RadioButtonList ID="optS1Q6" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                                </td>
                                                <td class="text-center">

                                                    1
                                                </td>
                                                <td class="text-center"><asp:Label ID="lblScoreS1Q6" runat="server" Text=""></asp:Label>


                                                </td>
                                            </tr>
                                            <tr>
                                                <td><asp:LinkButton ID="imgS1Q7" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 


                                                </td>
                                                <td class="text-red">

                                                    ข้อที่ 1.7 สถานที่ขายยาต้องมีสภาพเหมาะสมต่อการรักษาคุณภาพยา
                                                    โดยในพื้นที่ขายยาและเก็บสำรองยา ต้องมีการถ่ายเทอากาศที่ดี แห้ง
                                                    สามารถควบคุมอุณหภูมิให้ไม่เกิน 30 องศาเซลเซียส
                                                    และสามารถป้องกันแสงแดดไม่ให้ส่องโดยตรงถึงผลิตภัณฑ์ยา
                                                    (Critical Defect)
                                                </td>
                                                <td>
                                                     <asp:RadioButtonList ID="optS1Q7" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                                </td>
                                                <td class="text-center">

                                                    2
                                                </td>
                                                <td class="text-center"><asp:Label ID="lblScoreS1Q7" runat="server" Text=""></asp:Label>


                                                </td>
                                            </tr>
                                            <tr>
                                                <td><asp:LinkButton ID="imgS1Q8" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 


                                                </td>
                                                <td>

                                                    ข้อที่ 1.8 สถานที่ขายยาต้องมีแสงสว่างเพียงพอในการอ่านเอกสาร
                                                    อ่านฉลากผลิตภัณฑ์ยาและป้ายแสดงต่าง ๆ ได้อย่างชัดเจน
                                                </td>
                                                <td>
                                                     <asp:RadioButtonList ID="optS1Q8" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                                </td>
                                                <td class="text-center">

                                                    2
                                                </td>
                                                <td class="text-center"><asp:Label ID="lblScoreS1Q8" runat="server" Text=""></asp:Label>


                                                </td>
                                            </tr>
                                            <tr>
                                                <td><asp:LinkButton ID="imgS1Q9" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> </td>
                                                <td class="text-red">
                                                    ข้อที่ 1.9 บริเวณจัดวางยาอันตราย และยาควบคุมพิเศษในพื้นที่ของยา
                                                    จะต้อง 1.9.1
                                                    มีพื้นที่เพียงพอในการจัดวางยาแยกตามประเภทของยาและสามารถติดป้ายแสดงประเภทของยาได้ชัดเจนตามหลักวิชาการ
                                                    1.9.2 จัดให้มีวัสดุทึบใช้ปิดบังบริเวณที่จัดวางยาอันตราย
                                                    ยาควบคุมพิเศษ
                                                    สำหรับปิดในเวลาที่เภสัชกรหรือผู้มีหน้าที่ปฏิบัติการไม่อยู่ปฏิบัติหน้าที่
                                                    และจัดให้มีป้ายแจ้งให้ผู้มารับบริการทราบว่าเภสัชกรหรือผู้มีหน้าที่ปฏิบัติการไม่อยู่
                                                    (Critical lDefect)</td>
                                                <td>
                                                     <asp:RadioButtonList ID="optS1Q9" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                                    &nbsp;</td>
                                                <td class="text-center">

                                                    2</td>
                                                <td class="text-center"><asp:Label ID="lblScoreS1Q9" runat="server" Text=""></asp:Label>


                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <th>


                                                    &nbsp;</th>
                                                <th class="text-right">
                                                    </th>
                                                <th>


                                                    &nbsp;</th>
                                                <th class="text-center">

                                                   คะแนนที่ได้</th>
                                                <th class="text-center"><asp:Label ID="lblSumScoreS1" runat="server" Text=""></asp:Label></th>
                                            </tr>
                                        </tbody>
                                    </table>


                                </div>
                            </div>
                        </div>
                    </div>

                                     <div class="box box-solid">
            <div class="box-header">2. อุปกรณ์ <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>                                 
            </div> 
                        <div class="box-body">
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr>

                                        <th class="text-center" width="40">ไฟล์แนบ</th>
                                        <th class="text-center" width="1000">สิ่งที่ต้องตรวจสอบ</th>
                                        <th class="text-center" width="300">ระดับคะแนน</th>
                                        <th class="text-center">ค่าถ่วงน้ำหนัก</th>
                                        <th class="text-center">คะแนนที่ได้</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><asp:LinkButton ID="imgS2Q1" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 
                                            
                                        </td>
                                        <td>
                                            ข้อที่ 2.1 ตู้เย็น จำนวน 1 เครื่อง (เฉพาะกรณีมียาที่ต้องเก็บรักษา
                                            ในอุณหภูมิที่ต่ำกว่าอุณหภูมิห้อง) ในสภาพที่ใช้งานได้ตามมาตรฐาน
                                            มีพื้นที่เพียงพอสำหรับการจัดเก็บยาแต่ละชนิดเป็นสัดส่วนเฉพาะ
                                            ไม่ใช่เก็บของปะปนกับสิ่งของอื่น (Critical Defect)
                                        </td>
                                        <td>
                                             <table class="table no-border">
                                        <tr>
                                            <td style="width:55px;padding-top:10px;"><asp:CheckBox ID="chkS2Q1" runat="server" AutoPostBack="True" Text="ไม่มี" /></td>
                                              <td><asp:RadioButtonList ID="optS2Q1" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                       <asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList></td>
                                        </tr>
                                    </table>
                                        </td>
                                        <td class="text-center">

                                            2
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS2Q1" runat="server" Text=""></asp:Label>

                                            
                                                
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="imgS2Q2" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                            
                                        </td>
                                        <td class="text-red">

                                            ข้อ 2.2 ถาดนับเม็ดยาอย่างน้อย 2 ถาดในสภาพใช้งานได้ดี
                                            และกรณีต้องมีการแบ่งบรรจุยากลุ่มเพนนิซิลิน หรือยากลุ่มซัลโฟนาไมด์
                                            หรือยากลุ่มต้านการอักเสบชนิดที่ไม่ใช่สเตียรอยด์ (NSAID)
                                            ทั้งนี้อุปกรณ์นับเม็ดยาสำหรับยาในกลุ่มเพนนิซิลิน หรือยากลุ่มซัลโฟนาไมด์
                                            หรือยากลุ่มต้านการอักเสบชนิดที่ไม่ใช่สเตียรอยด์ (NSAID)
                                            ให้แยกใช้เด็ดขาดจากยากลุ่มอื่นๆ\(Critical Defect) 

                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS2Q2" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            2
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS2Q2" runat="server" Text=""></asp:Label>

                                            
                                                
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="imgS2Q3" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                            
                                        </td>
                                        <td class="text-red">

                                            ข้อที่ 2.3 เครื่องวัดความดันโลหิต (ชนิดอัตโนมัติ) จำนวน 1 เครื่อง
                                            ในสภาพที่ใช้งานได้ตามมาตรฐาน (Critical Defect)
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS2Q3" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            1
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS2Q3" runat="server" Text=""></asp:Label>

                                            
                                                
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="imgS2Q4" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                            
                                        </td>
                                        <td class="text-red">

                                            ข้อที่ 2.4 เครื่องชั่งน้ำหนักสำหรับผู้มารับบริการ จำนวน 1 เครื่อง
                                            ในสภาพที่ใช้งานได้ดี
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS2Q4" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            1
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS2Q4" runat="server" Text=""></asp:Label>                                        
                                                
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="imgS2Q5" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                            
                                        </td>
                                        <td class="text-red">

                                            ข้อที่ 2.5 มีอุปกรณ์ที่วัดส่วนสูงสำหรับผู้มารับบริการจำนวน 1 เครื่อง
                                            ในสภาพที่ใช้งานได้ดี (Critical Defect)
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS2Q5" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            1
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS2Q5" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="imgS2Q6" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                            
                                        </td>
                                        <td class="text-red">

                                            ข้อที่ 2.6 อุปกรณ์สำหรับดับเพลิง จำนวน 1
                                            เครื่องในสภาพที่สามารถพร้อมใช้งานได้อย่างมีประสิทธิภาพ
                                            อยู่ในบริเวรสถานที่เก็บยา (Critical Defect)
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS2Q6" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            1
                                        </td>
                                        <td class="text-center">  <asp:Label ID="lblScoreS2Q6" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>                         
                                    <tr>
                                        <th>


                                            &nbsp;</th>
                                        <th class="text-right">
                                           </th>
                                        <th>


                                            &nbsp;</th>
                                        <th class="text-center">

                                           คะแนนที่ได้</th>
                                        <th class="text-center"><asp:Label ID="lblSumScoreS2" runat="server" Text=""></asp:Label></th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                                     <div class="box box-solid">
            <div class="box-header">3.หมวดบุคลากร <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>                                 
            </div>
 
                        <div class="box-body">
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr>

                                        <th class="text-center" width="40">ไฟล์แนบ</th>
                                        <th class="text-left" width="1000">สิ่งที่ต้องตรวจสอบ</th>
                                        <th class="text-center" width="300">ระดับคะแนน</th>
                                        <th class="text-center">ค่าถ่วงน้ำหนัก</th>
                                        <th class="text-center">คะแนนที่ได้</th>
                                    </tr>
                                </thead>
                                <tbody>
                            <tr>
                                <td><asp:LinkButton ID="imgS3Q1" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 
                                </td>
                                <td>

                                    ข้อที่ 3.1 เภสัชกรเป็นผู้มีความรู้
                                    ความสามารถในการให้การบริการทางเภสัชกรรมชุมชน
                                </td>
                                <td>
                                     <asp:RadioButtonList ID="optS3Q1" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                </td>
                                <td class="text-center">

                                    2
                                </td>
                                <td class="text-center"><asp:Label ID="lblScoreS3Q1" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:LinkButton ID="imgS3Q2" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 


                                </td>
                                <td>

                                    ข้อที่ 3.2 พนักงานร้านยา ต้องมีความรู้เกี่ยวกับกฎหมายยา
                                    และงานที่ได้รับมอบหมายจนสามารถปฏิบัติงานได้ดี
                                    และผ่านการอบรมอย่างต่อเนื่องและเพียงพอ
                                </td>
                                <td>
                                    <table class="table no-border">
                                        <tr>
                                            <td style="width:55px;padding-top:10px;"><asp:CheckBox ID="chkS3Q2" runat="server" AutoPostBack="True" Text="ไม่มี" /></td>
                                              <td><asp:RadioButtonList ID="optS3Q2" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                       <asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList></td>
                                        </tr>
                                    </table>
                                  
                                   

                                </td>
                                <td class="text-center">

                                    1
                                </td>
                                <td class="text-center"><asp:Label ID="lblScoreS3Q2" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="imgS3Q3" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 
                                    
                                </td>
                                <td>

                                    ข้อที่ 3.3
                                    เภสัชกรจะต้องแต่งกายด้วยเสื้อกาวน์สีขาวติดเครื่องหมายสัญลักษณ์ของสภาเภสัชกรรม
                                    และแสดงตนว่าเป็นเภสัชกร
                                    ทั้งนี้เป็นไปตามสมควรเหมาะสมแก่ฐานะและศักดิ์ศรีแห่งวิชาชีพเภสัชกรรม
                                    แสดงตนให้แตกต่างจากพนักงานร้านยาและบุคลากรอื่นภายในร้านขายยา
                                </td>
                                <td>
                                     <asp:RadioButtonList ID="optS3Q3" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                </td>
                                <td class="text-center">

                                    1
                                </td>
                                <td class="text-center"><asp:Label ID="lblScoreS3Q3" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:LinkButton ID="imgS3Q4" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                    
                                </td>
                                <td>

                                    ข้อที่ 3.4 การแต่งกายพนักงานร้านยาและบุคลากรอื่นภายในร้านขายยา
                                    ต้องใส่สีเสื้อ
                                    ป้ายแสดงตนไม่สื่อไปในทางที่จะก่อให้เกิดความเข้าใจว่าเป็นเภสัชกร
                                </td>
                                <td>
                                     <table class="table no-border">
                                        <tr>
                                            <td style="width:55px;padding-top:10px;"><asp:CheckBox ID="chkS3Q4" runat="server" AutoPostBack="True" Text="ไม่มี" /></td>
                                              <td><asp:RadioButtonList ID="optS3Q4" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                       <asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList></td>
                                        </tr>
                                    </table>

                                </td>
                                <td class="text-center">

                                    1
                                </td>
                                <td class="text-center"><asp:Label ID="lblScoreS3Q4" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:LinkButton ID="imgS3Q5" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                    
                                </td>
                                <td>

                                    ข้อที่ 3.5 มีการแบ่งแยกบทบาท หน้าที่ และความรับผิดชอบของเภสัชกร
                                    พนักงานร้านยา และบุคลากรอื่นภายในร้านขายยาในการให้บริการไว้อย่างชัดเจน
                                    โดยคำนึงถึงความถูกต้องตามกฎหมายว่าด้วยยาและกฎหมายว่าด้วยวิชาชีพเภสัชกรรม
                                </td>
                                <td>
                                     <table class="table no-border">
                                        <tr>
                                            <td style="width:55px;padding-top:10px;"><asp:CheckBox ID="chkS3Q5" runat="server" AutoPostBack="True" Text="ไม่มี" /></td>
                                              <td><asp:RadioButtonList ID="optS3Q5" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                       <asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList></td>
                                        </tr>
                                    </table> 

                                </td>
                                <td class="text-center">

                                    1
                                </td>
                                <td class="text-center"><asp:Label ID="lblScoreS3Q5" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <th>                                   &nbsp;</th>
                                <th class="text-right">
                                   </th>
                                <th>


                                    &nbsp;</th>
                                <th class="text-center">

                                   คะแนนที่ได้</th>
                                <th class="text-center"><asp:Label ID="lblSumScoreS3" runat="server" Text=""></asp:Label></th>
                            </tr>
                        </tbody>
                    </table>
                        </div>
                    </div>
                                     <div class="box box-solid">
            <div class="box-header">4.หมวดการควบคุมคุณภาพยา <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>                                 
            </div> 
                        <div class="box-body">
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr>

                                        <th class="text-center" width="40">ไฟล์แนบ</th>
                                        <th class="text-left" width="1000">สิ่งที่ต้องตรวจสอบ</th>
                                        <th class="text-center" width="300">ระดับคะแนน</th>
                                        <th class="text-center">ค่าถ่วงน้ำหนัก</th>
                                        <th class="text-center">คะแนนที่ได้</th>
                                    </tr>
                                </thead>
                                <tbody>                                     
                                    <tr>
                                        <td><asp:LinkButton ID="imgS4Q1" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                            
                                        </td>
                                        <td class="text-red">

                                            ข้อที่ 4.1 ต้องมีการคัดเลือกยา และจัดหายาจากผู้ผลิต ผู้นำเข้า
                                            ผู้จำหน่ายที่ถูกต้องตามกฎหมายว่าด้วยยาและมีมาตรฐานตามหลักเกณฑ์วิธีการที่ดีในการผลิตจัดเก็บ
                                            และการขนส่ง (Critical Defect)
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS4Q1" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            2
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS4Q1" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="imgS4Q2" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                            
                                        </td>
                                        <td>

                                            ข้อที่ 4.2 ต้องมีการเก็บรักษายา ภายใต้สภาวะอุณหภูมิที่เหมาะสม หลีกเลี่ยง
                                            แสงแดด เป็นไปตามหลักวิชาการเพื่อให้ยานั้นคงคุณภาพที่ดี
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS4Q2" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            2
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS4Q2" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="imgS4Q3" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                            
                                        </td>
                                        <td class="text-red">

                                            ข้อที่ 4.3 ต้องมีระบบตรวจสอบยาที่หมดอายุหรือเสื่อมคุณภาพที่มีประสิทธิภาพ
                                            เพื่อไม่ให้มีไว้ ณ จุดจ่ายยา (Critical Defect)
                                        </td>
                                        <td>

                                             <asp:RadioButtonList ID="optS4Q3" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>
                                        </td>
                                        <td class="text-center">

                                            2
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS4Q3" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="imgS4Q4" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                            
                                        </td>
                                        <td>

                                            ข้อที่ 4.4 ต้องมีระบบการส่งคืนหรือทำลายยาที่หมดอายุ
                                            หรือยาเสื่อมคุณภาพให้ชัดเจน ถูกต้องตามหลักวิชาการ ไม่เป็นปัญหากับสิ่งแวดล้อม
                                            รวมถึงระบบการป้องกันการนำยาดังกล่าวไปจำหน่าย
                                        </td>
                                        <td>

                                             <asp:RadioButtonList ID="optS4Q4" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>
                                        </td>
                                        <td class="text-center">

                                            1
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS4Q4" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="imgS4Q5" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                            
                                        </td>
                                        <td>

                                            ข้อที่ 4.5 ต้องมีระบบการตรวจสอบคุณภาพยาคืนหรือยาเปลี่ยน
                                            ก่อนกลับมาจำหน่ายโดยคำนึงถึงประสิทธิภาพของยาและความปลอดภัยของผู้ใช้ยา
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS4Q5" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            1
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS4Q5" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="imgS4Q6" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                            
                                        </td>
                                        <td>

                                            ข้อที่ 4.6 ต้องจัดให้มีระบบเอกสารที่เกี่ยวกับการจัดหา
                                            จัดการคลังสินค้าและการจำหน่ายให้ถูกต้อง เป็นปัจจุบันสามารถสืบย้อนได้
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS4Q6" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            1
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS4Q6" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="imgS4Q7" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                            
                                        </td>
                                        <td>

                                            ข้อที่ 4.7 ต้องเลือกภาชนะบรรจุที่เหมาะสม
                                            เพื่อป้องกันไม่ให้ยาเสื่อมสภาพก่อนเวลาอันสมควรพร้อมฉลากยา
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS4Q7" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            2
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS4Q7" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    
                                    <tr>
                                        <th>


                                            &nbsp;</th>
                                        <th class="text-right">
                                            </th>
                                        <th>


                                            &nbsp;</th>
                                        <th class="text-center">

                                            คะแนนที่ได้</th>
                                        <th class="text-center"><asp:Label ID="lblSumScoreS4" runat="server" Text=""></asp:Label></th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                                     <div class="box box-solid">
            <div class="box-header">5.การปฏิบัติตามวิธีปฏิบัติทางเภสัชกรรมชุมชน <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>                                 
            </div> 
                        <div class="box-body">
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr>

                                        <th class="text-center" width="40">ไฟล์แนบ</th>
                                        <th class="text-left" width="1000">สิ่งที่ต้องตรวจสอบ</th>
                                        <th class="text-center" width="300">ระดับคะแนน</th>
                                        <th class="text-center">ค่าถ่วงน้ำหนัก</th>
                                        <th class="text-center">คะแนนที่ได้</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  
                                    <tr>
                                        <td><asp:LinkButton ID="imgS5Q1" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                            
                                        </td>
                                        <td class="text-red">

                                            ข้อที่ 5.1 การให้บริการทางเภสัชกรรม
                                            ตามหน้าที่ที่กฎหมายว่าด้วยยาและกฎหมายว่าด้วยวิชาชีพเภสัชกรรมต้องปฏิบัติโดยเภสัชกร
                                            5.1.1
                                            มีป้ายตามที่กฎหมายกำหนดและติดตั้งถูกต้อง-ป้ายสถานที่ขายยาแผนปัจจุบัน-ป้ายเภสัชกรผู้มีหน้าที่ปฏิบัติการ
                                            5.1.2
                                            มีใบอนุญาตตามที่กฎหมายกำหนดและติดตั้งถูกต้อง-ใบอนุญาตขายยาแผนปัจจุบัน-ใบประกอบวิชาชีพเภสัชกรรมของเภสัชกรผู้มีหน้าที่ปฏิบัติการ
                                            5.1.3 บัญชียาประเภทต่าง ๆ (เช่ยน ขย.๕ ขย.๑๑) และบันทึกถูกต้อง (Critical
                                            Defect)
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS5Q1" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>
                                        </td>
                                        <td class="text-center">

                                            2
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS5Q1" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="imgS5Q2" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                            
                                        </td>
                                        <td>

                                            ข้อที่ 5.2 ต้องซักถามข้อมูลที่จำเป็นของผู้ที่มารับบริการ
                                            เพื่อประกอบการพิจารณาก่อนเลือกสรรยาหรือผลิตภัณฑ์สุขภาพที่มีประสิทธิภาพ
                                            ปลอดภัย เหมาะสมกับผู้ป่วยตามหลักวิชาการ สมเหตุสมผลตามมาตรฐานการประกอบวิชาชีพ
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS5Q2" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            2
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS5Q2" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="imgS5Q3" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 
                                            
                                        </td>
                                        <td>

                                            ข้อที่ 5.3 จัดให้มีฉลากบนซองบรรจุยา
                                            หรือภาชนะบรรจุยาอันตรายและยาควบคุมพิเศษที่ส่งมอบให้ผู้รับบริการโดยต้องแสดงข้อมูลอย่างน้อย
                                            ดังนี้ 5.3.1 ชื่อ ที่อยู่ของร้ายขายยาและหมายเลขโทรศัพท์ที่สามารถติดต่อได้
                                            5.3.2 ข้อมูลเพื่อให้ผู้รับบริการใช้ยาได้อย่างถูกต้อง เหมาะสม ปลอดภัย
                                            ติดตามได้ดังนี้ – วันที่จ่าย-ชื่อผู้รับบริการ-ชื่อยาที่เป็นชื่อสามัญทางยา
                                            หรือชื่อการค้า
                                            ความแรงจำนวนจ่าย-ข้อบ่งใช้-วิธีใช้ยาที่ชัดเจนเข้าใจง่าย-ฉลากช่วย คำแนะนำ
                                            คำเตือน หรือเอกสารให้ความรู้เพิ่มเติม (ถ้าจำเป็น) – ลายมือชื่อเภสัชกร
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS5Q3" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            2
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS5Q3" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="imgS5Q4" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 
                                            
                                        </td>
                                        <td>

                                            ข้อที่ 5.4 การส่งมอบยาอันตราย ยาควบคุมพิเศษ ให้กับผู้มารับบริการเฉพาะราย
                                            ต้องกระทำโดยเภสัชกรผู้มีหน้าที่ปฏิบัติการเท่านั้น
                                            พร้อมให้คำแนะนำตามหลักวิชาการและจรรยาบรรณ แห่งวิชาชีพ
                                            โดยต้องให้ข้อมูลดังนี้-ชื่อยา-ข้อบ่งใช้-ขนาด และวิธีการใช้-ผลข้างเคียง (side
                                            effect) (ถ้ามี) และอาการไม่พึงประสงค์จากการใช้ยา (Adverse Drug
                                            Reaction)
                                            ที่อาจเกิดขึ้น-ข้อควรระวังและข้อควรปฏิบัติในการใช้ยา-การปฏิบัติเมื่อเกิดปัญหาจากการใช้ยา)
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS5Q4" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            2
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS5Q4" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="imgS5Q5" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                            
                                        </td>
                                        <td>

                                            ข้อที่ 5.5
                                            มีกระบวนการในการป้องกันการแพ้ยาซ้ำของผู้มารับบริการที่มีประสิทธิภาพเหมาะสม
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS5Q5" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            2
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS5Q5" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="imgS5Q6" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 
                                            
                                        </td>
                                        <td>

                                            ข้อที่ 5.6 มีกระบวนการคัดกรองและส่งต่อผู้ป่วยที่เหมาะสม
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS5Q6" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            2
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS5Q6" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="imgS5Q7" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 
                                            
                                        </td>
                                        <td>

                                            ข้อที่ 5.7
                                            กรณีที่มีการผลิตยาตามใบสั่งยาของผู้ประกอบวิชาชีพเวชกรรมหรือของผู้ประกอบโรคศิลปะที่สั่งสำหรับคนไข้เฉพาะรายหรือตามใบสั่งยาของผู้ประกอบวิชาชีพการสัตวแพทย์
                                            สำหรับสัตว์เฉพาะรายและการแบ่งบรรจุยาในสถานที่ขายยาให้คำนึงถึงการปนเปื้อน
                                            การแพ้ยา โดยต้องจัดให้มีสถานที่
                                            อุปกรณ์ตามที่กำหนดและเป็นไปตามมาตรฐานการประกอบวิชาชพีเภสัชกรรมด้านการผลิตยาสำหรับคนไข้เฉพาะรายของสภาเภสัชกรรม
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS5Q7" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            2
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS5Q7" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="imgS5Q8" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 
                                            
                                        </td>
                                        <td>

                                            ข้อที่ 5.8 ต้องจัดให้มีกระบวนการเฝ้าระวังอาการไม่พึงประสงค์
                                            พฤติกรรมการใช้ยาไม่เหมาะสม ปัญหาคุณภาพยา
                                            และรายงานให้หน่วยงานที่เกี่ยวข้องทราบ
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS5Q8" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            1
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS5Q8" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="imgS5Q9" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 
                                            
                                        </td>
                                        <td>

                                            ข้อที่ 5.9 จัดให้มีแหล่งข้อมูลอ้างอิงด้านยาที่เหมาะสมเชื่อถือได้
                                            สำหรับใช้ในการให้บริการทางเภสัชกรรมเพื่อส่งเสริมการใช้ยาอย่างถูกต้อง ปลอดภัย
                                            รวมทั้งการให้บริการเภสัชสนเทศ
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS5Q9" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            1
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS5Q9" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="imgS5Q10" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 
                                            
                                        </td>
                                        <td>

                                            ข้อที่ 5.10
                                            การจัดวางสื่อให้ความรู้และสื่อโฆษณาสำหรับผู้มารับบริการจะต้องได้รับคำยินยอมอย่างเป็นลายลักษณ์อักษรจากเภสัชกรผู้มีหน้าที่ปฏิบัติการ
                                            และให้ถือเป็นความรับผิดชอบที่เภสัชกรผู้มีหน้าที่ปฏิบัติการจะต้องควบคุม
                                            โดยจะต้องไม่โอ้อวด ไม่บิดเบือนความจริง ไม่สร้างความเข้าใจผิดให้ผู้บริโภค
                                            และต้องผ่านการอนุญาตถูกต้องตามกฎหมาย
                                        </td>
                                        <td>

                                             <asp:RadioButtonList ID="optS5Q10" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>
                                        </td>
                                        <td class="text-center">

                                            1
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS5Q10" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="imgS5Q11" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 
                                            
                                        </td>
                                        <td>

                                            ข้อที่ 5.11 การดำเนินกิจกรรมด้านสุขภาพที่เกี่ยวข้องกับผู้มารับบริการในร้านยา
                                            โดยบุคลากรอื่นซึ่งมิใช่เภสัชกรหรือพนักงานร้านยา
                                            จะต้องได้รับคำยินยอมเป็นลายลักษณ์อักษรจากเภสัชกร
                                            และให้ถือเป็นความรับผิดชอบที่เภสัชกรจะต้องควบคุมกำกับการดำเนินกิจกรรมต่าง ๆ
                                            ในสถานที่ขายยาให้ถูกต้องตามกฎหมายว่าด้วยยาหรือกฎหมายอื่นที่เกี่ยวข้องกับผลิตภัณฑ์สุขภาพนั้น
                                            ๆ รวมทั้งกฎหมายว่าด้วยวิชาชีพเภสัชกรรม
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS5Q11" runat="server"
                                                        RepeatDirection="Horizontal" CssClass="table no-border"  AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            1
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS5Q11" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="imgS5Q12" runat="server" CssClass="file-upload btn btn-primary"><i class="fa fa-camera"></i></asp:LinkButton> 

                                            
                                        </td>
                                        <td>

                                            ข้อที่ 5.12 ไม่จำหน่ายผลิตภัณฑ์ยาสูบและเครื่องดื่มที่มีส่วนผสมของแอลกฮอล์
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="optS5Q12" runat="server"  RepeatDirection="Horizontal" CssClass="table no-border" AutoPostBack="True">
                                                        <asp:ListItem Value="-1">ไม่มี</asp:ListItem><asp:ListItem Value="0">ปรับปรุง</asp:ListItem>
                                                        <asp:ListItem Value="1"> พอใช้</asp:ListItem>
                                                        <asp:ListItem Value="2">ดี</asp:ListItem>
                                                    </asp:RadioButtonList>

                                        </td>
                                        <td class="text-center">

                                            1
                                        </td>
                                        <td class="text-center"><asp:Label ID="lblScoreS5Q12" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th>


                                            &nbsp;</th>
                                        <th class="text-right">
                                           </th>
                                        <th>


                                            &nbsp;</th>
                                        <th class="text-center">

                                           คะแนนที่ได้</th>
                                        <th class="text-center"><asp:Label ID="lblSumScoreS5" runat="server" Text=""></asp:Label></th>
                                    </tr>
                                </tbody>
                            </table>
                            <br />

                        </div>
                    </div>
            </ContentTemplate>
                                <Triggers> 
                                     <asp:AsyncPostBackTrigger ControlID="cmdSave" EventName="Click" /> 
                                     <asp:AsyncPostBackTrigger ControlID="imgS1Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q6"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q7"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q8"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q9"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q6"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q6"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q7"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q6"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q7"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q8"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q9"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q10"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q11"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q12"  EventName="Click" />
                                    
                                       <asp:AsyncPostBackTrigger ControlID="txtFinalScore" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>  
                                    </section>
            </div>
      <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>       
    <div class="row"> 

     
 <section class="col-lg-6 connectedSortable">
  

              <div class="card-shadow-success border mb-3 card card-body border-success">
                  <h5 class="card-title">สรุปคะแนนประเมิน</h5>
                    
   <div class="col-lg-12">
       <table class="table table-no-bordered">
           <tr>
               <td width="150">คะแนนรวมทั้งหมด</td>
               <td width="100">    
                                <asp:Label ID="lblTotalScore" runat="server" CssClass="text-bold"></asp:Label>
               </td>
               <td>คะแนน</td>
           </tr>
           <tr>
               <td>คะแนนที่ได้</td>
               <td>    
                                <asp:Label ID="lblNetScore" runat="server" CssClass="text-bold text-blue"></asp:Label>
               </td>
               <td>คะแนน</td>
           </tr>
           <tr>
               <td>คิดเป็น (%)</td>
               <td> <asp:Label ID="lblPercentage" runat="server" CssClass="text-bold text-blue"></asp:Label></td>
               <td>%</td>
           </tr>
             <tr>
               <td>สรุปผล</td>
               <td> <asp:Label ID="lblResult" runat="server" CssClass="text-bold"></asp:Label>
               </td>
               <td></td>
           </tr>
       </table>

       </div>
                             </div>
         </section>
                                     <section class="col-lg-6 connectedSortable">
            <div class="card-shadow-success border mb-3 card card-body border-success">
                  <h5 class="card-title">สรุปคะแนนประเมิน จากผู้ตรวจประเมิน</h5>
                    
   <div class="col-lg-12 app-page-header">
       <table class="table table-no-bordered">           
           <tr>
               <td width="150">คะแนนที่ได้</td>
               <td width="100">    
                                <asp:TextBox ID="txtFinalScore" runat="server" CssClass="text-bold text-blue text-center" Width="100" AutoPostBack="True"></asp:TextBox>
               </td>
               <td>คะแนน</td>
           </tr>
           <tr>
               <td>คิดเป็น (%)</td>
               <td> <asp:Label ID="lblFinalPercent" runat="server" CssClass="text-bold text-blue"></asp:Label></td>
               <td>%</td>
           </tr>
             <tr>
               <td>สรุปผล</td>
               <td colspan="2">  
                   <asp:DropDownList ID="ddlFinalResult" runat="server" CssClass="form-control select2">
                       <asp:ListItem Value="Y">ผ่าน</asp:ListItem>
                       <asp:ListItem Value="N">ไม่ผ่าน</asp:ListItem>
                   </asp:DropDownList>
                 </td>
           </tr>
           <tr>
               <td>ความคิดเห็น</td>
               <td colspan="2">
                   <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" TextMode="MultiLine" Height="50"></asp:TextBox>
               </td>
           </tr>
       </table>
       </div>
                             </div>
                      
  
  </section> 

    </div>
 </ContentTemplate>
                                <Triggers>  
                                     <asp:AsyncPostBackTrigger ControlID="imgS1Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q6"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q7"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q8"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q9"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q6"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q6"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q7"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q6"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q7"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q8"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q9"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q10"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q11"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q12"  EventName="Click" />

                                       <asp:AsyncPostBackTrigger ControlID="txtFinalScore" EventName="TextChanged" />

                                </Triggers>
                            </asp:UpdatePanel>   
   
            <div class="row">
                                    <div class="col-md-12 text-center">
                                        <asp:Button ID="cmdSave" runat="server" Text="บันทึก"  CssClass="btn btn-primary" Width="120px"/>
                                         <asp:Button ID="cmdBack" CssClass="btn btn-secondary" runat="server" Text="กลับหน้าหลัก" Width="120px" />
                                        </div>

                            </div>
                <!-- Modal HTML -->  
             <div id="modal-window-upl"  class="modal fade modal-window"  role="dialog" data-backdrop="static" tabindex="-1" style="display: none;" aria-hidden="true" >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header-window">             
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h6 class="modal-title-window">อัพโหลดไฟล์รูปภาพ/เอกสาร
                </h6>
          </div>
          <div class="modal-body"> 
   <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate> 
  <div class="row">
   <div class="col-md-12">
        <asp:Label ID="lblTopic" runat="server" CssClass="h6 text-bold"></asp:Label>  
<asp:HiddenField ID="hdAccID" runat="server" />
       </div>
      </div>
   
      <div class="row">
   <div class="col-md-12">
          <div class="form-group">
          
                                    <table>
               <tr>
                   <td style="width:200px"><div class="file-upload-big"><asp:FileUpload  ID="FileUpload1" runat="server"   AllowMultiple="true" /><i class="fa fa-camera"></i></div></td>
                                <td style="width:100%" rowspan="2">
                                       <div class="app-page-header">
                <div class="page-title-wrapper">
                    <div class="page-title-heading">                      
                        <div><div class="page-title-subheading">คำแนะนำ</div>
                            <br />
                            - ไฟล์นามสกุล .jpg, .jpeg, .gif, .png,.pdf เท่านั้น    <br />
                            - ขนาดไฟล์ไม่เกิน 1024 Kb. <br />
                            - เพิ่มได้ไม่เกิน 4 รูป   <br /> <br />
                        </div>
                    </div>
                </div>
            </div> </td>                             
                            </tr>
 <tr>   <td>

       
     <asp:Button ID="cmdUpImg" runat="server" Text="Upload" CssClass="btn btn-success" Width="200" /> 
                            
                      </td>          
     </tr>
</table>
     
              <br />
                      
          </div>
        </div>      
      </div>

 </ContentTemplate>
                                <Triggers> 
                                    <asp:PostBackTrigger ControlID="cmdUpImg" />
                                      <asp:AsyncPostBackTrigger ControlID="grdImg" EventName="RowCommand" />
                                     <asp:AsyncPostBackTrigger ControlID="imgS1Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q6"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q7"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q8"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q9"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q6"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q6"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q7"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q6"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q7"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q8"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q9"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q10"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q11"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q12"  EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel> 

  <div class="row">
   <div class="col-md-12">
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate> 
                                              <asp:Label ID="Label2" runat="server" CssClass="text-red"></asp:Label>               
<asp:GridView ID="grdImg" CssClass="table table-hover"  
                             runat="server" CellPadding="2" 
                                                        GridLines="None" 
                      AutoGenerateColumns="False"  
                             Font-Bold="False">
                        <RowStyle BackColor="#F7F7F7" />
                        <columns>
                            <asp:BoundField DataField="nRow" HeaderText="No." >
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                            </asp:BoundField>                      
                            <asp:ImageField HeaderText="ไฟล์/รูปภาพ" DataImageUrlField="filePathView">
                                <ControlStyle Height="50px" Width="50px" />
                            </asp:ImageField>
                             <asp:TemplateField HeaderText="">
                                 <ItemTemplate>    
                                     <asp:ImageButton ID="imgView" runat="server" ImageUrl="images/view.png" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "FilePath") %>'></asp:ImageButton> 
                                 </ItemTemplate>
                                 <ItemStyle Width="30px" />
                            </asp:TemplateField>  
                              <asp:TemplateField HeaderText="">
                                 <ItemTemplate> 
                                     <asp:ImageButton ID="imgDelFile" runat="server"  CommandArgument='<%# DataBinder.Eval(Container.DataItem, "UID") %>' ImageUrl="images/delete.png" />
                                 </ItemTemplate>
                                 <ItemStyle Width="30px" />
                            </asp:TemplateField>
                                                     
                        </columns>
                        <footerstyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />                     
                        <pagerstyle HorizontalAlign="Center" 
                             CssClass="dc_pagination dc_paginationC dc_paginationC11" />                     
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <headerstyle CssClass="th" Font-Bold="True" />                     
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                     </asp:GridView>
 </ContentTemplate>
                                <Triggers> 
                                    <asp:PostBackTrigger ControlID="cmdUpImg" />
                                    <asp:AsyncPostBackTrigger ControlID="grdImg" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="imgS1Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q6"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q7"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q8"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS1Q9"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS2Q6"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS3Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q6"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS4Q7"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q1"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q2"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q3"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q4"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q5"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q6"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q7"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q8"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q9"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q10"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q11"  EventName="Click" />
 <asp:AsyncPostBackTrigger ControlID="imgS5Q12"  EventName="Click" />

                                </Triggers>
                            </asp:UpdatePanel>  
 </div>            
        </div>
         <div class="row">
   <div class="col-md-12 text-center"> 
  <button class="btn btn-secondary" data-dismiss="modal">Close</button>
       </div>
      </div>
              </div>            
        </div>
      </div>
    </div>  
                                   
 <div id="modal-window" class="modal fade modal-window"  role="dialog" data-backdrop="static" tabindex="-1" style="display: none;z-index: 9999;" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header-window">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h6 class="modal-title-window">&nbsp;<span id="spnTitle2"></span></h6>
          </div>
          <div class="modal-body"> 
      <div class="row">
   <div class="col-md-12">
          <div class="form-group">
              <span id="spnMsg2"></span>
              <br />
              <img id="img1" src="" style="width:100%;display: inline-block;" />
                <br />               
          </div>
        </div>      
      </div>
               <div class="row">
   <div class="col-md-12 text-center"> 
  <button class="btn btn-secondary" data-dismiss="modal">Close</button>
       </div>
      </div>
          </div>            
        </div>
      </div>
    </div>  

	<!--- End Modal --->
        </section>

    </asp:Content>