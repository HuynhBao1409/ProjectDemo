﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace quanlycycybergames.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class ChiTietDonHang
    {
        [Display(Name = "Mã đơn hàng")]
        public string MaDH { get; set; }
        [Display(Name = "Mã dịch vụ")]
        public string ID_DV { get; set; }
        [Display(Name = "Số lượng")]
        public string soluong { get; set; }
        [Display(Name = "Tổng giá")]
        public Nullable<decimal> tongGia { get; set; }
    
        public virtual DichVu DichVu { get; set; }
        public virtual DonHang DonHang { get; set; }
    }
}