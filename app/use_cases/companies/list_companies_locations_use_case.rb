module Companies
  class ListCompaniesLocationsUseCase
    def self.call
      YAML.safe_load(File.open("#{Rails.root}/db/data/provinces.yml"))
    end

    def self.random
      call.sample
    end
  end
end