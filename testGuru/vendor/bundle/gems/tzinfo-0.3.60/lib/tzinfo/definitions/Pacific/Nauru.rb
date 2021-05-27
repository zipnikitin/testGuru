# encoding: UTF-8

module TZInfo
  module Definitions
    module Pacific
      module Nauru
        include TimezoneDefinition
        
        timezone 'Pacific/Nauru' do |tz|
          tz.offset :o0, 40060, 0, :LMT
          tz.offset :o1, 41400, 0, :'+1130'
          tz.offset :o2, 32400, 0, :'+09'
          tz.offset :o3, 43200, 0, :'+12'
          
          tz.transition 1921, 1, :o1, 10466081437, 4320
          tz.transition 1942, 8, :o2, 116668801, 48
          tz.transition 1945, 9, :o1, 19453649, 8
          tz.transition 1979, 2, :o3, 287418600
        end
      end
    end
  end
end
