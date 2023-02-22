# frozen_string_literal: true

module Api
  module V1
    class ContentsController < ApplicationController
      def index
        @content = []
        add_to_content(@content, Movie.all)
        add_to_content(@content, Season.all)

        render json: @content.sort_by { |c| c[:created_at] }, status: 200
      end

      private

      def add_to_content(content, objectList)
        objectList.each do |o|
          content << if o.has_attribute?('number')
                       { title: o.title, plot: o.plot, number: o.number, created_at: o.created_at }
                     else
                       { title: o.title, plot: o.plot, created_at: o.created_at }

                     end
        end
      end
    end
  end
end
