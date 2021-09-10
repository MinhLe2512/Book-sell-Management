<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="donhang.ascx.cs" Inherits="BTL.admin.DonDatHang.donghang" %>
<div id="listDonHang">
    <div id="contain_btn_donhang">
        <input id="btnRefreshDonHang" type="button" value="Làm mới dữ liệu" onclick="loadData();" />
        <div id="backListDonHang" onclick="BackListDonHang();">Quay lại</div>
    </div>
    <table id="tblDonHang">
    </table>
    <div id="totalMoney"></div>
    <div id="shadow_EditDonHang"></div>
    <div id="WrapEditDonHang" class="WrapEditDonHang">
        <div id="btnClose" onclick="closeWrapEditDonHang();">X</div>
        <p>Thay đổi tình trạng đơn hàng:</p>
        <input type="radio" id="chuaXacNhan" name="tinhTrang" value="0">
        <label for="chuaXacNhan">Chưa xác nhận</label><br>
        <input type="radio" id="daXacNhan" name="tinhTrang" value="1">
        <label for="daXacNhan">Đã xác nhận</label><br>
        <input type="radio" id="dangGiao" name="tinhTrang" value="2">
        <label for="dangGiao">Đang giao</label><br>
        <input type="radio" id="daThanhToan" name="tinhTrang" value="3">
        <label for="daThanhToan">Đã thanh toán</label><br>
        <div class="contain_btn">
            <div id="btnCancelEditDonHang"  onclick="closeWrapEditDonHang();">Cancel</div>
            <div id="btnSaveEditDonHang" onclick="EditDonHang();">Save</div>
        </div>      
    </div>
</div>
<script type="text/javascript">

    window.addEventListener('load', (event) => {
        loadData();
    });

    var xmlDoc = "";
    var totalMoney = document.getElementById("totalMoney");
    var backListDonHang = document.getElementById("backListDonHang");
    var shadow_EditDonHang = document.getElementById("shadow_EditDonHang");
    var WrapEditDonHang= document.getElementById("WrapEditDonHang");

    function loadData() {
        totalMoney.style.visibility = "hidden";
        backListDonHang.style.display = "none";
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
               // alert(this.responseText);
                hienThiDonHangXML(this);
            }
        };
        xhttp.open("GET", "admin/DonDatHang/ProcessDonHang.aspx?process=getListDonHangXML", true);
        xhttp.send();
    }

    function hienThiDonHangXML(xml)
    {
        xmlDoc = xml.responseXML;
        hienThiDonHangFromXML();
    }

    function hienThiDonHangFromXML() { 
        var dtDonHang = document.getElementById('tblDonHang');
        //alert('Có ' + xmlData.length + ' dòng dữ liệu.');
        var x = xmlDoc.getElementsByTagName("MyTableName");
        if (x.length > 0)
        {
            var tbl_th = "";
            //tbl_th + "<table id='tblListDonHang'>";
            tbl_th += "<tr id=\"th_donHang\"><td>Ngày lập</td>";
            tbl_th += "<td>Tình trạng</td>";
            tbl_th += "<td>Kiểu thanh toán</td>";
            tbl_th += "<td>Họ tên</td>";
            tbl_th += "<td>SĐT</td>";
            tbl_th += "<td>Email</td>";
            tbl_th += "<td>Địa chỉ</td>";
            tbl_th += "<td>Ghi chú</td>";
            tbl_th += "<td>Chi tiết</td></tr>";
            dtDonHang.innerHTML = tbl_th;
            for (var i = 0; i < x.length; i++)
            {
                var rHang = dtDonHang.insertRow(dtDonHang.rows.length);

                let ngaylap = new Date(x[i].getElementsByTagName("ngayLap")[0].childNodes[0].nodeValue);
                var cellNgayLap = rHang.insertCell(0);
                cellNgayLap.appendChild(document.createTextNode(ngaylap.toLocaleDateString("vn")));

                var cellTinhTrang = rHang.insertCell(1);
                var span_tinhTrang = document.createElement("span");
                span_tinhTrang.className = "txt_tinhTrang";
                span_tinhTrang.innerHTML = x[i].getElementsByTagName("tinhTrang")[0].childNodes[0].nodeValue; 
                var span_edit = document.createElement("span");
                span_edit.innerHTML = "edit";
                span_edit.className = "editTinhTrang";
                span_edit.setAttribute("id_don_hang", x[i].getElementsByTagName("id")[0].childNodes[0].nodeValue);
                span_edit.setAttribute("intTinhTrang",x[i].getElementsByTagName("intTinhTrang")[0].childNodes[0].nodeValue);
                span_edit.onclick = EditTinhTrangClicked;
                cellTinhTrang.appendChild(span_tinhTrang);
                cellTinhTrang.appendChild(span_edit);

                var cellKieuThanhToan = rHang.insertCell(2);
                cellKieuThanhToan.appendChild(document.createTextNode(x[i].getElementsByTagName("kieuThanhToan")[0].childNodes[0].nodeValue));

                var cellHoTen = rHang.insertCell(3);
                cellHoTen.appendChild(document.createTextNode(x[i].getElementsByTagName("hoTen")[0].childNodes[0].nodeValue));

                var cellSDT = rHang.insertCell(4);
                cellSDT.appendChild(document.createTextNode(x[i].getElementsByTagName("sdt")[0].childNodes[0].nodeValue));

                var cellEmail = rHang.insertCell(5);
                let email = x[i].getElementsByTagName("email")[0].childNodes[0];
                if (email != undefined)  cellEmail.appendChild(document.createTextNode(email.nodeValue));
                else cellEmail.appendChild(document.createTextNode(""));

                var cellDiaChi = rHang.insertCell(6);
                cellDiaChi.appendChild(document.createTextNode(x[i].getElementsByTagName("diaChi")[0].childNodes[0].nodeValue));

                var cellGhiChu = rHang.insertCell(7);
                let ghichu = x[i].getElementsByTagName("ghiChu")[0].childNodes[0];
                if (ghichu != undefined) cellGhiChu.appendChild(document.createTextNode(ghichu.nodeValue));
                else cellGhiChu.appendChild(document.createTextNode(""));

                var cellAct = rHang.insertCell(8);
                var sButton = "<td><span type='button' class=\"chiTietDonHang\" onClick='showDetailDonHang(\"" + x[i].getElementsByTagName("id")[0].childNodes[0].nodeValue + "\", this);'/>Chi tiết</span></td>";
                cellAct.innerHTML = sButton;
            }//end for
        }
        else {
            alert('Không có dữ liệu');
        }
    }

    function showDetailDonHang(donhang_id) {
    // alert('click chi tiết ' + donhang_id);
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function ()
        {
            if (this.readyState == 4 && this.status == 200)
            {
                hienThiDetailDonHang(this.responseText);
            }
        };
        xhttp.open("GET", "admin/DonDatHang/ProcessDonHang.aspx?process=getChiTietDonHang&donHangID=" + donhang_id, true);
        xhttp.send();
    }

    var formatter = new Intl.NumberFormat('vn', {
        style: 'currency',
        currency: 'vnd',

        // These options are needed to round to whole numbers if that's what you want.
        //minimumFractionDigits: 0,
        //maximumFractionDigits: 0,
    });

    function hienThiDetailDonHang(sData) {

        var jsonData = JSON.parse(sData);
         var dtDonHang = document.getElementById('tblDonHang');
        if (jsonData.length > 0)
        {
             var tbl_th = "";
            tbl_th += "<tr id=\"th_donHang\">";
            tbl_th += "<td>Tên Đồng Hồ</td>";
            tbl_th += "<td>Đơn giá</td>";
            tbl_th += "<td>Xuất xứ</td>";
            tbl_th += "<td>Số lượng</td>";
            tbl_th += "</tr>";
            dtDonHang.innerHTML = tbl_th;
            let tongTien = 0;
            for (let i = 0; i < jsonData.length; i++)
            {
                var rHang = dtDonHang.insertRow(dtDonHang.rows.length);

                let cellNameDH = rHang.insertCell(0);
                cellNameDH.appendChild(document.createTextNode(jsonData[i].ten));
                let cellDonGia = rHang.insertCell(1);
                cellDonGia.appendChild(document.createTextNode(formatter.format(jsonData[i].price)));
                let cellXuatXu = rHang.insertCell(2);
                cellXuatXu.appendChild(document.createTextNode(jsonData[i].xuatXu));
                let cellSoLuong= rHang.insertCell(3);
                cellSoLuong.appendChild(document.createTextNode(jsonData[i].soLuong));
                tongTien = Number(tongTien)+ Number(jsonData[i].price) * Number(jsonData[i].soLuong);
            }//end for
            backListDonHang.style.display = "block";
            totalMoney.innerHTML ="Tổng tiền: "+ formatter.format(tongTien);
            totalMoney.style.visibility = "visible";
           
        }
        else
        {
          
            alert('Không có dữ liệu');
        }
    }

    function BackListDonHang()
    {
        totalMoney.style.visibility = "hidden";
        backListDonHang.style.display = "none";
        hienThiDonHangFromXML();
    }

    var idDHToEditTinhTrang = -1;
    function EditDonHang()
    {
        let valueChecked = "";
        if (document.getElementById('chuaXacNhan').checked) {
            valueChecked = document.getElementById('chuaXacNhan').value;
        }
        else if (document.getElementById('daXacNhan').checked) {
            valueChecked = document.getElementById('daXacNhan').value;
        }
        else if (document.getElementById('dangGiao').checked) {
            valueChecked = document.getElementById('dangGiao').value;
        }
        else if (document.getElementById('daThanhToan').checked) {
            valueChecked = document.getElementById('daThanhToan').value;
        }
        //alert(valueChecked);

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function ()
        {
            if (this.readyState == 4 && this.status == 200)
            {
                if (this.responseText == "edit_success")
                {
                    alert('sửa thành công');
                    loadData();
                }
                else
                    alert('sửa thất bại');
            }
        };
        xhttp.open("GET", "admin/DonDatHang/ProcessDonHang.aspx?process=editTinhTrang&donHangIDEdit=" + idDHToEditTinhTrang + "&tinhTrang=" + valueChecked, true);
        xhttp.send();
        shadow_EditDonHang.style.visibility = "hidden";
        WrapEditDonHang.className = "WrapEditDonHang";
    }

    function EditTinhTrangClicked()
    {
        let intTinhTrang = this.getAttribute('intTinhTrang');
        if (intTinhTrang == 0)
            document.getElementById('chuaXacNhan').checked = true;
        else if (intTinhTrang == 1)
            document.getElementById('daXacNhan').checked = true;
        else if (intTinhTrang == 2)
            document.getElementById('dangGiao').checked = true;
        else if (intTinhTrang == 3)
            document.getElementById('daThanhToan').checked = true;

        shadow_EditDonHang.style.visibility = "visible";
        WrapEditDonHang.className = "WrapEditDonHang showWrapEditDonHang";
       idDHToEditTinhTrang=this.getAttribute('id_don_hang');
    }

    function closeWrapEditDonHang() {
        shadow_EditDonHang.style.visibility = "hidden";
        WrapEditDonHang.className = "WrapEditDonHang";
    }
</script>