FactoryBot.define do
  factory :user do
    human_first_name {"太郎"}
    human_last_name {"山田"}
    human_first_name_rubi {"タロウ"}
    human_last_name_rubi {"ヤマダ"}
    email {Faker::Internet.free_email}
    password {"111aaa"}
    password_confirmation {password}
    pets_name {"ぽち"}
    pets_name_rubi {"ポチ"}
    pets_type {"ヨーキー"}
    pets_age {"5"}
  end
end
