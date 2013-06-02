module ActsAsSqlTree

  class Railtie < Rails::Railtie
    initializer 'acts_as_sql_tree.insert_into_active_record' do
      ActiveSupport.on_load :active_record do
        ActiveRecord::Base.send(:include, ActsAsSqlTree)
      end
    end
  end

end
