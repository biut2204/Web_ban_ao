package com.example.demo.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "San_Pham")
public class SanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id")
    UUID id;

    @Column(name = "Ma")
    String ma;

    @Column(name = "Ten")
    String ten;

    @Column(name = "Anh")
    String anh;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdLA",referencedColumnName = "Id")
    LoaiAo loaiAo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdCA",referencedColumnName = "Id")
    CoAo coAo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdTA",referencedColumnName = "Id")
    TayAo tayAo;

    @Column(name = "Gia")
    int gia;

    @Column(name = "TrangThai")
    String trangThai;
}
