require 'acts_as_sql_tree'

module ActiveRecord
  module Acts #:nodoc:
    module Tree
      include ::ActsAsSqlTree

      def self.included(base)
        Kernel.warn "[DEPRECATION] The module ActiveRecord::Acts::Tree has moved to ActsAsSqlTree"

        base.extend ::ActsAsSqlTree::ClassMethods
      end
    end
  end
end
