package com.example.demo.controller;

import com.example.demo.entity.CoAo;
import com.example.demo.entity.LoaiAo;
import com.example.demo.entity.SanPham;
import com.example.demo.entity.TayAo;
import com.example.demo.service.CoAoSer;
import com.example.demo.service.LoaiAoSer;
import com.example.demo.service.SanPhamSer;
import com.example.demo.service.TayAoSer;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

@MultipartConfig
@Controller
public class SanPhamController {

    @Autowired
    TayAoSer tayAoSer;

    @Autowired
    CoAoSer coAoSer;

    @Autowired
    LoaiAoSer loaiAoSer;

    @Autowired
    SanPhamSer sanPhamSer;

    List<TayAo> listTayAo;

    List<CoAo> listCoAo;

    List<LoaiAo> listLoaiAo;

    List<SanPham> listSanPham;

    @GetMapping("/san-pham/view")
    public ModelAndView viewSanPham(Model model, @RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo) {

        listLoaiAo = loaiAoSer.getAll();
        listCoAo = coAoSer.getAll();
        listTayAo = tayAoSer.getAll();
        listSanPham = sanPhamSer.getAll();

        model.addAttribute("listLA", listLoaiAo);
        model.addAttribute("listCA", listCoAo);
        model.addAttribute("listTA", listTayAo);

        Page<SanPham> page = sanPhamSer.view(pageNo, 4);
        ModelAndView mav = new ModelAndView("/view-san-pham");
        mav.addObject("page", page);
        return mav;
    }

    @PostMapping("/san-pham/add")
    public String addSanPham(HttpServletRequest request, HttpSession session, @RequestParam("anh") MultipartFile anh) {

        SanPham sanPham = new SanPham();

        Path path = Paths.get("uploads/");

        try {
            InputStream inputStream = anh.getInputStream();
            Files.copy(inputStream,path.resolve(anh.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);

        } catch (IOException e) {
            e.printStackTrace();
        }


        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        sanPham.setAnh(anh.getOriginalFilename().toLowerCase());
        String idLoaiAo = request.getParameter("idLoaiAo");
        String idCoAo = request.getParameter("idCoAo");
        String idTayAo = request.getParameter("idTayAo");
        String trangThai = request.getParameter("trangThai");
        String gia = request.getParameter("gia");

        if (ma.trim().length() == 0 || ten.trim().length() == 0|| trangThai.trim().length() == 0|| gia.trim().length() == 0) {
            session.setAttribute("loi", "Không được để trống");
            return "redirect:/asm/admin-view#/san-pham/view";
        }

        LoaiAo loaiAo = loaiAoSer.findId(UUID.fromString(idLoaiAo));
        CoAo coAo = coAoSer.findId(UUID.fromString(idCoAo));
        TayAo tayAo = tayAoSer.findId(UUID.fromString(idTayAo));

        sanPham.setMa(ma);
        sanPham.setTen(ten);
        sanPham.setLoaiAo(loaiAo);
        sanPham.setCoAo(coAo);
        sanPham.setTayAo(tayAo);
        sanPham.setGia(Integer.parseInt(gia));
        sanPham.setTrangThai(trangThai);

        sanPhamSer.add(sanPham);

        return "redirect:/asm/admin-view#/san-pham/view";
    }

    @PostMapping("/san-pham/update")
    public String updateSanPham(HttpServletRequest request, HttpSession session, @RequestParam("anh") MultipartFile anh) {

        SanPham sanPham = new SanPham();

        Path path = Paths.get("uploads/");

        try {
            InputStream inputStream = anh.getInputStream();
            Files.copy(inputStream,path.resolve(anh.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);

        } catch (IOException e) {
            e.printStackTrace();
        }


        String id = request.getParameter("id");
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        sanPham.setAnh(anh.getOriginalFilename().toLowerCase());
        String idLoaiAo = request.getParameter("idLoaiAo");
        String idCoAo = request.getParameter("idCoAo");
        String idTayAo = request.getParameter("idTayAo");
        String trangThai = request.getParameter("trangThai");
        String gia = request.getParameter("gia");

        LoaiAo loaiAo = loaiAoSer.findId(UUID.fromString(idLoaiAo));
        CoAo coAo = coAoSer.findId(UUID.fromString(idCoAo));
        TayAo tayAo = tayAoSer.findId(UUID.fromString(idTayAo));

        sanPham.setMa(ma);
        sanPham.setTen(ten);
        sanPham.setLoaiAo(loaiAo);
        sanPham.setCoAo(coAo);
        sanPham.setTayAo(tayAo);
        sanPham.setGia(Integer.parseInt(gia));
        sanPham.setTrangThai(trangThai);

        sanPhamSer.update(UUID.fromString(id),sanPham);

        return "redirect:/asm/admin-view#/san-pham/view";
    }

    @PostMapping("/san-pham/detail")
    public String detailSanPham(Model model, HttpServletRequest request, HttpSession session) {
        String id = request.getParameter("detail");
        SanPham sanPham = sanPhamSer.findId(UUID.fromString(id));
        session.setAttribute("sanPham", sanPham);
        return "redirect:/asm/admin-view#/san-pham/view";
    }

    @PostMapping("/san-pham/remove")
    public String delêtSanPham(Model model, HttpServletRequest request, HttpSession session) {
        String id = request.getParameter("delete");
        sanPhamSer.delete(UUID.fromString(id));
        return "redirect:/asm/admin-view#/san-pham/view";
    }

    @PostMapping("/san-pham/search")
    public ModelAndView searchSanPham(Model model,
                                        @RequestParam(required = false) Integer min,
                                        @RequestParam(required = false) Integer max,
                                        @RequestParam(value = "pageNo",required = false,defaultValue = "0") Integer pageNo
                                        ) {

        listLoaiAo = loaiAoSer.getAll();
        listCoAo = coAoSer.getAll();
        listTayAo = tayAoSer.getAll();

        model.addAttribute("listLA", listLoaiAo);
        model.addAttribute("listCA", listCoAo);
        model.addAttribute("listTA", listTayAo);

        Page<SanPham> page = sanPhamSer.search(min, max, pageNo, 5);
        ModelAndView mav = new ModelAndView("/view-search");
        mav.addObject("page", page);
        return mav;
    }
}
