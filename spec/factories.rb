FactoryGirl.define do
  factory :company do
    sequence(:name) {|n| "Company#{n}"}
    phone "1223344"
    address "Test address"
    factory :company_with_brend do
      after_create do |c|
        FactoryGirl.create(:brend,:company => c)
      end
    end
    factory :company_brend_campaign do
      after_create do |c|
        brend = FactoryGirl.create(:brend, :company => c)
        FactoryGirl.create(:campaign, :brend => brend)
      end
    end
  end

  factory :brend do
    sequence(:name) {|n| "Brend#{n}"}
    company
    factory :brend_with_company do
      before_create do |c|
        FactoryGirl.create(:company)
      end
    end
  end

  factory :campaign do
    brend
    started_at Time.now
    ended_at Time.now+1.hour
    start_timezone "(GMT-07:00) Arizona"
    end_timezone "(GMT-07:00) Arizona"
    languages({"1"=>["ara (ar) - Arabic", "bod (bo) - Tibetan"]})
    regions({"1"=>"Anguilla"})
    factory :campaign_with_brend do
      before_create do |c|
        FactoryGirl.create(:brend_with_company)
      end
    end
  end

end
