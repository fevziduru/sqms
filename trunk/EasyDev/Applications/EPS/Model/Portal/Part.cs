using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.EPS.Portal;
using EasyDev.EPS.Attributes;

namespace EasyDev.EPS.Portal
{
        [DatabaseName("Oracle")]
        public class Part : AbstractModel
        {
                /// <summary>
                /// PARTID Field 
                /// </summary>
                [KeyProperty]
                [DisplayName("��������")]
                public string PARTID { get; set; }

                /// <summary>
                /// ZONEID Field 
                /// </summary>
                [DisplayName("�������")]
                public string ZONEID { get; set; }

                /// <summary>
                /// PARTDESC Field 
                /// </summary>
                [DisplayName("��������")]
                public string PARTDESC { get; set; }

                /// <summary>
                /// PARTNAME Field 
                /// </summary>
                [DisplayName("��������")]
                public string PARTNAME { get; set; }

                /// <summary>
                /// PARTORDER Field 
                /// </summary>
                [DisplayName("�������")]
                public decimal PARTORDER { get; set; }

                /// <summary>
                /// PARTTYPE Field 
                /// </summary>
                [DisplayName("��������")]
                public string PARTTYPE { get; set; }

                /// <summary>
                /// SERVICETYPE Field 
                /// </summary>
                [DisplayName("�������ݷ�������")]
                public string SERVICETYPE { get; set; }

                /// <summary>
                /// VOID Field 
                /// </summary>
                [DisplayName("����")]
                public string VOID { get; set; }

                /// <summary>
                /// CREATED Field 
                /// </summary>
                [DisplayName("��������")]
                public DateTime CREATED { get; set; }

                /// <summary>
                /// MODIFIED Field 
                /// </summary>
                [DisplayName("�޸�����")]
                public DateTime MODIFIED { get; set; }

                /// <summary>
                /// PARTTITLE Field 
                /// </summary>
                [DisplayName("��������")]
                public string PARTTITLE { get; set; }

                /// <summary>
                /// DATAPROVIDER Field 
                /// </summary>
                [DisplayName("���������ṩ��")]
                public string DATAPROVIDER { get; set; }
        }
}