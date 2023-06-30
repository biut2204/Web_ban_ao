package com.example.demo.controller;

import com.example.demo.entity.GioHang;
import com.example.demo.entity.HoaDon;
import com.example.demo.service.GioHangSer;
import com.example.demo.service.HoaDonSer;
import com.example.demo.service.KhachHangSer;
import com.example.demo.service.NguoiBanSer;
import com.example.demo.service.SanPhamSer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class HoaDonController {
    @Autowired
    SanPhamSer sanPhamSer;

    @Autowired
    GioHangSer gioHangSer;

    @Autowired
    KhachHangSer khachHangSer;

    @Autowired
    HoaDonSer hoaDonSer;

    @Autowired
    NguoiBanSer nguoiBanSer;

    @GetMapping("/asm/hoa-don")
    public String viewHoaDon(HttpSession session, Model model) {
        Object idKHObject = session.getAttribute("idKh");
        String idKH = idKHObject.toString();
        List<String> listMa = hoaDonSer.findByIdKh(UUID.fromString(idKH));
        List<Integer> listTongTien = new ArrayList<>();
        List<String> listTrangThai = new ArrayList<>();
        for (String ma : listMa) {
            listTongTien.add(hoaDonSer.tongTien(ma));
            listTrangThai.add(hoaDonSer.findTrangThai(ma));
        }
        model.addAttribute("listTongTien", listTongTien);
        model.addAttribute("listTrangThai", listTrangThai);
        model.addAttribute("listMa", listMa);
        return "/khach-hang-hoa-don";
    }


    @PostMapping("/asm/add-hoa-don")
    public String addHoaDon(@RequestParam(value = "chon", required = false) List<UUID> chon, HttpSession session) {
        LocalTime now = LocalTime.now();
        Object idKHObject = session.getAttribute("idKh");
        String idKH;
        if (idKHObject == null) {
            idKH = null;
        } else {
            idKH = idKHObject.toString();
        }
        if (idKH == null) {
            if (chon != null) {
                for (UUID id : chon) {
                    HoaDon hoaDon = new HoaDon();
                    GioHang gioHang = gioHangSer.fingId(id);
                    hoaDon.setGioHang(gioHang);
                    hoaDon.setTongTien(gioHang.getSoLuong() * gioHang.getSanPham().getGia());
                    hoaDon.setMa("Ma" + now.getHour() + now.getMinute() + now.getSecond());
                    hoaDon.setTrangThai("Chờ");
                    session.setAttribute("maHd", "Ma" + now.getHour() + now.getMinute() + now.getSecond());
                    hoaDonSer.add(hoaDon);
                }
            }
        } else {
            if (chon != null) {
                for (UUID id : chon) {
                    HoaDon hoaDon = new HoaDon();
                    GioHang gioHang = gioHangSer.fingId(id);
                    hoaDon.setGioHang(gioHang);
                    hoaDon.setTongTien(gioHang.getSoLuong() * gioHang.getSanPham().getGia());
                    hoaDon.setMa("Ma" + now.getHour() + now.getMinute() + now.getSecond());
                    hoaDon.setKhachHang(khachHangSer.findId(UUID.fromString(idKH)));
                    hoaDon.setTrangThai("Chờ");
                    session.setAttribute("maHd", "Ma" + now.getHour() + now.getMinute() + now.getSecond());
                    session.setAttribute("khachHangDiaChi", khachHangSer.findId(UUID.fromString(idKH)));
                    hoaDonSer.add(hoaDon);
                }
            }
        }


        String ma = (String) session.getAttribute("maHd");
        session.setAttribute("tongTien", hoaDonSer.tongTien(ma));
        return "/view-hoa-don";
    }

    @PostMapping("/hoa-don/cho-xac-nhan")
    public String choXacNhan(HttpServletRequest request, Model model){
        String ma = request.getParameter("ma");
        int tongTien = hoaDonSer.tongTien(ma);
        model.addAttribute("maHd",ma);
        model.addAttribute("tongTien",tongTien);
        return "/view-hoa-don";
    }

    @PostMapping("/hoa-don/xac-nhan")
    public String xacNhan(HttpServletRequest request, Model model,HttpSession session){
        String ma = request.getParameter("ma");
        Object idKHObject = session.getAttribute("idNb");
        String idNb;
        idNb = idKHObject.toString();
        List<HoaDon> hoaDonList = hoaDonSer.getByMa(ma);
        for (HoaDon hoaDon : hoaDonList) {
            hoaDon.setTrangThai("OK");
            hoaDon.setNguoiBan(nguoiBanSer.findId(UUID.fromString(idNb)));
            hoaDonSer.update(hoaDon.getId(), hoaDon);
        }
        return "redirect:/asm/admin-view#/asm/hoa-don-all";
    }

    @PostMapping("/hoa-don/thanh-toan")
    public String thanhToanHoadon(HttpServletRequest request, HttpSession session) {
        String ma = request.getParameter("ma");
        List<HoaDon> hoaDonList = hoaDonSer.getByMa(ma);

        Object idKHObject = session.getAttribute("idKh");
        String idKH;
        if (idKHObject == null) {
            idKH = null;
        } else {
            idKH = idKHObject.toString();
        }

        if (idKH == null) {
            for (HoaDon hoaDon : hoaDonList) {
                hoaDon.setDiaChi(request.getParameter("diaChiMoi1"));
                hoaDon.setSdt(request.getParameter("soDienThoaiMoi1"));
                hoaDon.setTrangThai("Chờ xác nhận");
                hoaDonSer.update(hoaDon.getId(), hoaDon);
            }
        } else {
            String option = request.getParameter("option");
            if (option.equals("2")) {
                for (HoaDon hoaDon : hoaDonList) {
                    hoaDon.setDiaChi(request.getParameter("diaChiMoi2"));
                    hoaDon.setSdt(request.getParameter("soDienThoaiMoi2"));
                    hoaDon.setTrangThai("Chờ xác nhận");
                    hoaDonSer.update(hoaDon.getId(), hoaDon);
                }
            } else if (option.equals("3")) {
                for (HoaDon hoaDon : hoaDonList) {
                    hoaDon.setDiaChi(request.getParameter("diaChiMoi3"));
                    hoaDon.setSdt(request.getParameter("soDienThoaiMoi3"));
                    hoaDon.setTrangThai("Chờ xác nhận");
                    hoaDonSer.update(hoaDon.getId(), hoaDon);
                }
            }
        }
        return "/view-hoa-don";
    }
}
