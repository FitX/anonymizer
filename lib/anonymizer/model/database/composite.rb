# frozen_string_literal: true

# Basic class to communication with databese
class Database
  class Composite < Database
    def self.query(table_name, column_name, info)
      column_type = info['type']

      querys = []

      query = "UPDATE #{table_name} SET #{column_name} = "
      query += manage_concat(info['composite'], column_type)
      query += "WHERE #{table_name}.#{column_name} IS NOT NULL"

      querys.push query

      querys
    end


    def self.manage_concat(composite, type)
      query = 'CONCAT('
      size = composite.size

      composite.each do |data|
        query += "#{data}"
        if data != composite.last
          query += ','
        end
      end
      query += ") "

      query
    end


  end
end
