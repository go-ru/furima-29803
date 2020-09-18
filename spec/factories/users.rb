FactoryBot.define do
  factory :user do
    nickname              {Faker::JapaneseMedia::OnePiece.character }
    email                 {Faker::Internet.free_email }
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Gimei.last.kanji}
    last_name             {Gimei.first.kanji}
    furigana_first        {Gimei.last.katakana }
    furigana_last         {Gimei.first.katakana}
    birthday              {Faker::Date.birthday}
  end
end
