class SampleJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    users = User.all
    users.each do |user|
      Sidekiq::Logging.logger.info "サンプルジョブの実行#{user.name}"
    end
  end
end
