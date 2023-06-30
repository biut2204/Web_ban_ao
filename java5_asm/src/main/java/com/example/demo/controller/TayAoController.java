package com.example.demo.controller;

import com.example.demo.entity.CoAo;
import com.example.demo.entity.LoaiAo;
import com.example.demo.entity.SanPham;
import com.example.demo.entity.TayAo;
import com.example.demo.service.CoAoSer;
import com.example.demo.service.LoaiAoSer;
import com.example.demo.service.SanPhamSer;
import com.example.demo.service.TayAoSer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.UUID;

@Controller
public class TayAoController {
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

    @GetMapping("/asm/view-tay-ao")
    public ModelAndView viewTayAo(Model model, @RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo) {
        Page<TayAo> page = tayAoSer.phanTrang(pageNo, 5);
        ModelAndView mav = new ModelAndView("/view-tay-ao");
        mav.addObject("page", page);
        return mav;
    }

    @PostMapping("/tay-ao/add")
    public String addTayAo(HttpServletRequest request, HttpSession session) {

        TayAo tayAo = new TayAo();

        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");

        if (ma.isEmpty() || ten.isEmpty()) {
            session.setAttribute("loi", "Không được để trống");
            return "redirect:/asm/admin-view#/asm/view-tay-ao";
        } else {

            tayAo.setMa(ma);
            tayAo.setTen(ten);

            tayAoSer.add(tayAo);

            return "redirect:/asm/admin-view#/asm/view-tay-ao";
        }
    }

    @PostMapping("/tay-ao/update")
    public String updateTayAo(HttpServletRequest request, HttpSession session) {

        TayAo tayAo = new TayAo();

        String id = request.getParameter("id");
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        if (ma.trim().length() == 0 || ten.trim().length() == 0) {
            session.setAttribute("loi", "Không được để trống");
            return "redirect:/asm/admin-view#/asm/view-co-ao";
        } else {
            tayAo.setMa(ma);
            tayAo.setTen(ten);

            tayAoSer.update(UUID.fromString(id), tayAo);

            return "redirect:/asm/admin-view#/asm/view-tay-ao";
        }
    }

    @PostMapping("/tay-ao/detail")
    public String detailTayAo(Model model, HttpServletRequest request, HttpSession session) {
        String id = request.getParameter("detail");
        TayAo tayAo = tayAoSer.findId(UUID.fromString(id));
        session.setAttribute("tayAo", tayAo);
        return "redirect:/asm/admin-view#/asm/view-tay-ao";
    }

    @PostMapping("/tay-ao/remove")
    public String deleteTayAo(Model model, HttpServletRequest request) {
        String id = request.getParameter("delete");
        tayAoSer.delete(UUID.fromString(id));
        return "redirect:/asm/admin-view#/asm/view-tay-ao";
    }
}
