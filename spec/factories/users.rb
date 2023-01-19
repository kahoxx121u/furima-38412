FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    #ユーザー名
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password { "a1" + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name_kanji { person.first.kanji }
    surname_kanji { person.last.kanji }
    first_name_kana { person.first.katakana }
    surname_kana { person.last.katakana }
    date_of_birth { Faker::Date.backward }
  end
end
