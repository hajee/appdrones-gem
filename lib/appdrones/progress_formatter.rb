require 'net/http'
require 'uri'


module Appdrones
  class ProgressFormatter
    attr_accessor :last_feature_name
    attr_accessor :last_scenario_name
    attr_accessor :last_status
    attr_accessor :work_package


    def initialize(step_mother, path_or_io, options)
      @work_package = 9
      @token = "xfSAhuqm2vau1N1Jx8GG"
    end

    def before_feature(feature)
      @last_feature_name =  feature.title
      @last_scenario_name =  ""
      @last_status = 'passed'
    end

    def after_feature(feature)
      @last_feature_name = ""
    end

   def scenario_name(keyword, name, file_colon_line, source_indent)
    @last_scenario_name = name
   end

    def after_step_result(keyword, step_match, multiline_arg, status, exception, source_indent, background, file_colon_line)
      if  status != 'pased'
        @last_status = 'failed'
      end
    end


     def after_feature_element(feature_element)
      send_progress_report
    end

private
    def send_progress_report
      url = URI.escape("http://localhost:3000/work/#{@work_package}/progress_reports/#{@last_feature_name}/#{@last_scenario_name}")
      post = Net::HTTP.post_form(URI.parse(url), status: @last_status, auth_token:@token)
    end

  end
end
