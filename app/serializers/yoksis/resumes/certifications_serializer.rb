# frozen_string_literal: true

module Yoksis
  module Resumes
    class CertificationsSerializer < Serializer
      attribute(:id)                     { object[:s_id].try(:to_i)                    }
      attribute(:name)                   { object[:adi]                                }
      attribute(:content)                { object[:icerik]                             }
      attribute(:type_id)                { object[:tur_id].try(:to_i)                  }
      attribute(:type_name)              { object[:tur_adi]                            }
      attribute(:location)               { object[:yer]                                }
      attribute(:purview_id)             { object[:kapsam].try(:to_i)                  }
      attribute(:purview_text)           { object[:kapsam_ad]                          }
      attribute(:due_date)               { object[:sure].try(:to_i)                    }
      attribute(:started_at)             { build_date(*object[:bastar].split('.').reverse.collect(&:to_i)) }
      attribute(:ended_at)               { build_date(*object[:bittar].split('.').reverse.collect(&:to_i)) }
      attribute(:academic_title_id)      { object[:unvan_id].try(:to_i)                }
      attribute(:academic_title_text)    { object[:unvan_ad]                           }
      attribute(:university_id)          { object[:kurum_id].try(:to_i)                }
      attribute(:university_name)        { object[:kurum_ad]                           }
      attribute(:members_number)         { object[:kisi_sayisi].try(:to_i)             }
      attribute(:country)                { object[:ulke_sehir].split('/').first        }
      attribute(:city)                   { object[:ulke_sehir].split('/').last         }
      attribute(:updated_at)             { Time.zone.parse(object[:guncelleme_tarihi]) }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].try(:to_i)             }
      attribute(:active_or_passive_text) { object[:aktif_pasif_ad]                     }
      attribute(:tesv_point)             { object[:tesv_puan].try(:to_f)               }
    end
  end
end
