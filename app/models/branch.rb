class Branch < ApplicationRecord
  has_many :customer

  def self.create_branch(branch_attrs)
    Branch.create!(name: branch_attrs[:name])
  end

  def self.update_branch(branch_attrs)
    branch = Branch.find_by_id(branch_attrs[:id])
    branch.name = branch_attrs[:name]
    branch.update_attributes(branch_attrs)
  end

end
