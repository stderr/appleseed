module Pandarus
  class V1 < APIBase
    remove_method :create_single_quiz_question
    def create_single_quiz_question(course_id,quiz_id,question__question_name__,question__question_text__,opts={})
      query_param_keys = [
      ]

      form_param_keys = [
        :question__question_name__,
        :question__question_text__,
        :question__quiz_group_id__,
        :question__question_type__,
        :question__position__,
        :question__points_possible__,
        :question__correct_comments__,
        :question__incorrect_comments__,
        :question__neutral_comments__,
        :question__text_after_answers__,
        :question__answers__,
      ]

      # verify existence of params
      raise "course_id is required" if course_id.nil?
      raise "quiz_id is required" if quiz_id.nil?
      raise "question__question_name__ is required" if question__question_name__.nil?
      raise "question__question_text__ is required" if question__question_text__.nil?
      # set default values and merge with input
      options = underscored_merge_opts(opts,
        :course_id => course_id,
        :quiz_id => quiz_id,
        :question__question_name__ => question__question_name__,
        :question__question_text__ => question__question_text__
      )

      # resource path
      path = path_replace("/v1/courses/{course_id}/quizzes/{quiz_id}/questions",
        :course_id => course_id,
        :quiz_id => quiz_id)
      headers = nil
      answers = options[:question][:answers]
      form_params = select_params(options, form_param_keys)
      query_params = select_params(options, query_param_keys)
      form_params[:"question[answers]"] = answers
      if opts[:next_page]
        pagination_params = page_params_load(:post, path)
        query_params.merge! pagination_params if pagination_params
      end
      response = mixed_request(:post, path, query_params, form_params, headers)
      page_params_store(:post, path)
      QuizQuestion.new(response)
    end
  end
end
