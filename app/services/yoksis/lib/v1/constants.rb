# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      GRADUATES_METHODS = {
        students:                          :tc_kimlik_noil_mezun_ogrenci_sorgulav2,
      }.freeze
      MEB_METHODS = {
        students:                          :mezuniyet_verilerini_getir_detay,
      }.freeze
      REFERENCES_METHODS = {
        administrative_functions:          :get_personel_gorev,
        administrative_units:              :get_idari_birimler,
        cities:                            :get_il_getir,
        countries:                         :get_mernis_ulke,
        districts:                         :get_ilce_getir,
        entrance_types:                    :get_giris_turu,
        gender:                            :get_mernis_cinsiyet,
        kod_bid:                           :get_kod_bid,
        martyrs_relatives:                 :get_ogrenci_gazi_sehit_yakini,
        nationalities:                     :get_mernis_uyruk,
        staff_titles:                      :get_kadro_gorev_unvan,
        student_disability_types:          :get_ogrenci_engel_turu,
        student_dropout_types:             :get_ogrenci_ayrilma_nedeni,
        student_education_levels:          :get_ogrenci_doykm,
        student_entrance_point_types:      :get_ogrenci_giris_puan_turu,
        student_entrance_types:            :get_ogrenci_giris_turu,
        student_grades:                    :get_ogrenci_sinif,
        student_grading_systems:           :get_ogrenci_diploma_not_sistemi,
        student_punishment_types:          :get_ceza_turu,
        studentship_rights:                :get_ogrenci_ogrencilik_hakki,
        studentship_statuses:              :get_ogrencilik_statusu,
        unit_instruction_languages:        :get_ogrenim_dili,
        unit_instruction_types:            :get_ogrenim_turu,
        unit_statuses:                     :get_aktiflik_durumu,
        unit_types:                        :get_birim_turu,
        university_types:                  :get_universite_turu,
      }.freeze
      REGISTRATIONS_METHODS = {
        foundation_tuitions:               :vakif_ogrenim_ucretiv1,
        queries_by_date:                   :belirtilen_gun_online_kayit_olan_ogrencileri_getirv1,
        queries_by_id_number:              :tc_kimlik_no_ile_online_kayit_ogrenci_bilgi_getirv1,
      }.freeze
      RESUMES_METHODS = {
        certifications:                    :get_arastirma_sertifka_bilgisi_v1,
        articles:                          :get_makale_bilgisi_v1,
        projects:                          :getir_proje_listesi,
      }.freeze
      STAFF_METHODS = {
        academicians_by_id_number:         :kullaniciya_gore_tc_kimlik_nodan_akademik_personel_bilgisiv1,
        academicians_by_page:              :kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1,
        nationalities:                     :get_mernis_uyruk,
        pages:                             :kullaniciya_gore_universiteki_akademik_personel_sayfa_sayisiv1,
      }.freeze
      STUDENTS_METHODS = {
        informations:                      :tc_kimlik_noile_ogrenci_sorgula_detayv4,
      }.freeze
      UNITS_METHODS = {
        changes:                           :tarihten_birim_degisiklik_getirv4,
        programs:                          :alt_birimdeki_programlari_getirv4,
        subunits:                          :alt_birimleri_getirv4,
        universities:                      :universiteleri_getirv4,
      }.freeze
      GRADUATES_RESULT_PATHS = {
        students:                         %i[tc_kimlik_noil_mezun_ogrenci_sorgulav2_response
                                             mezun_ogrenci_kayitlari],
      }.freeze
      MEB_RESULT_PATHS = {
        students:                         %i[mezuniyet_verilerini_getir_detay_response
                                             mezuniyet_verilerini_getir_detay_result
                                             mezuniyet_veri_listesi_detay
                                             mezuniyet_veri_listesi_detay],
      }.freeze
      REFERENCES_RESULT_PATHS = {
        administrative_functions:         %i[get_personel_gorev_response referanslar             ],
        administrative_units:             %i[get_idari_birimler_response idari_birimler          ],
        countries:                        %i[get_mernis_ulke_response referanslar                ],
        districts:                        %i[get_ilce_getir_response ilce_kodlari                ],
        entrance_types:                   %i[get_giris_turu_response referanslar                 ],
        gender:                           %i[get_mernis_cinsiyet_response referanslar            ],
        kod_bid:                          %i[get_kod_bid_response referanslar                    ],
        martyrs_relatives:                %i[get_ogrenci_gazi_sehit_yakini_response referanslar  ],
        nationalities:                    %i[get_mernis_uyruk_response referanslar               ],
        cities:                           %i[get_il_getir_response il_kodu                       ],
        staff_titles:                     %i[get_kadro_gorev_unvan_response referanslar          ],
        student_disability_types:         %i[get_ogrenci_engel_turu_response referanslar         ],
        student_dropout_types:            %i[get_ogrenci_ayrilma_nedeni_response referanslar     ],
        student_education_levels:         %i[get_ogrenci_doykm_response referanslar              ],
        student_entrance_point_types:     %i[get_ogrenci_giris_puan_turu_response referanslar    ],
        student_entrance_types:           %i[get_ogrenci_giris_turu_response referanslar         ],
        student_grades:                   %i[get_ogrenci_sinif_response referanslar              ],
        student_grading_systems:          %i[get_ogrenci_diploma_not_sistemi_response referanslar],
        student_punishment_types:         %i[get_ceza_turu_response referanslar                  ],
        studentship_rights:               %i[get_ogrenci_ogrencilik_hakki_response referanslar   ],
        studentship_statuses:             %i[get_ogrencilik_statusu_response referanslar         ],
        unit_instruction_languages:       %i[get_ogrenim_dili_response referanslar               ],
        unit_instruction_types:           %i[get_ogrenim_turu_response referanslar               ],
        unit_statuses:                    %i[get_aktiflik_durumu_response referanslar            ],
        unit_types:                       %i[get_birim_turu_response referanslar                 ],
        university_types:                 %i[get_universite_turu_response referanslar            ],
      }.freeze
      REGISTRATIONS_RESULT_PATHS = {
        foundation_tuitions:              %i[vakif_ogrenim_ucretiv1_response                             ],
        queries_by_id_number:             %i[tc_kimlik_no_ile_online_kayit_ogrenci_bilgi_getirv1_response],
        queries_by_date:                  %i[belirtilen_gun_online_kayit_olan_ogrencileri_getirv1_response
                                             universite_online_kayit_olan_ogrenciler                     ],
      }.freeze
      RESUMES_RESULT_PATHS = {
        certifications:                   %i[get_arastirma_sertifka_bilgisi_v1_response arastirma_liste],
        articles:                         %i[get_makale_bilgisi_v1_response makale_liste],
        projects:                         %i[getir_proje_listesi_response proje_listesi],
      }.freeze
      STAFF_RESULT_PATHS = {
        academicians_by_id_number:        %i[kullaniciya_gore_tc_kimlik_nodan_akademik_personel_bilgisiv1_response
                                             akademik_personel                                                      ],
        academicians_by_page:             %i[kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1_response
                                             akademik_personeller                                                   ],
        nationalities:                    %i[get_mernis_uyruk_response referanslar                                  ],
        pages:                            %i[kullaniciya_gore_universiteki_akademik_personel_sayfa_sayisiv1_response
                                             toplam_sayfa_sayisi                                                    ],
      }.freeze
      STUDENTS_RESULT_PATHS = {
        personal_informations:            %i[tc_kimlik_noile_ogrenci_sorgula_detayv4_response ogrenci_kayitlari kisisel_bilgiler    ],
        studentship_informations:         %i[tc_kimlik_noile_ogrenci_sorgula_detayv4_response ogrenci_kayitlari ogrencilik_bilgileri],
        unit_informations:                %i[tc_kimlik_noile_ogrenci_sorgula_detayv4_response ogrenci_kayitlari birim               ],
        undergrad_transfer_informations:  %i[tc_kimlik_noile_ogrenci_sorgula_detayv4_response ogrenci_kayitlari ygecis_birim_id     ],
      }.freeze
      UNITS_RESULT_PATHS = {
        changes:                          %i[tarihten_birim_degisiklik_getirv4_response birimler],
        subunits:                         %i[alt_birimleri_getirv4_response birimler            ],
        universities:                     %i[universiteleri_getirv4_response universiteler      ],
        programs:                         %i[alt_birimdeki_programlari_getirv4_response birimler],
      }.freeze
    end
  end
end
