class ResetAllCompanyCacheCounters < ActiveRecord::Migration[7.0]
  def up
    Company.all.each do |company|
      Company.reset_counters(company.id, :comments)
    end
  end

  def down
    # no rollback needed
  end
end
