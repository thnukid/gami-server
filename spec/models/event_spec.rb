require 'rails_helper'

RSpec.describe Event, :type => :model do
  it { should belong_to(:user)}

  describe "model validation" do
    it {should validate_presence_of(:user)}
    it {should validate_presence_of(:name)}
  end

  describe '#create_event_from_data' do


    let(:email) { 'glockenbeat@kabisa.nl' }
    let(:user) { create :user }
    let!(:alias) { create :alias, user: user, email: email }
    subject { Event.create_event_from_data(data) }

    context 'email found' do

      let(:data) {{ email: email, data: '1234', name: 'commit' }}
      it { expect(subject.user).to eql(user) }
      it { expect(subject).to be_kind_of(Event) }
      it { expect{subject}.to change{Event.count}.from(0).to(1) }

    end

    context 'email not found' do
      let(:data) {{ email: 'glockenbeat@ali.de', data: '1234', name: 'commit' }}
      it {expect(subject).to eql(nil)}
    end
  end


  #describe 'Routing' do
   #it { should route(:post, 'api/events').to('events#create') }
  #end

  describe 'aggregate properties' do
    let(:event) {create :event, data: "{\"game\":{\"commits_count\":1,\"commit_stats\":{\"rm_total\":1,\"add_total\":3,\"mod_total\":2},\"repo\":\"thnukid/gami-server\",\"message\":\"add resources with user_name to routes, rescue all errors within application controller\"},\"raw\":\"{\\\"ref\\\":\\\"refs/heads/master\\\",\\\"before\\\":\\\"0e0cf808ba0ca570c49f35cb84efc4fb0ef8737a\\\",\\\"after\\\":\\\"d9302b57a2bccc61314ee9ea5912a27221cd0ae2\\\",\\\"created\\\":false,\\\"deleted\\\":false,\\\"forced\\\":false,\\\"base_ref\\\":null,\\\"compare\\\":\\\"https://github.com/thnukid/gami-server/compare/0e0cf808ba0c...d9302b57a2bc\\\",\\\"commits\\\":[{\\\"id\\\":\\\"d9302b57a2bccc61314ee9ea5912a27221cd0ae2\\\",\\\"distinct\\\":true,\\\"message\\\":\\\"add resources with user_name to routes, rescue all errors within application controller\\\",\\\"timestamp\\\":\\\"2014-10-13T15:06:10+02:00\\\",\\\"url\\\":\\\"https://github.com/thnukid/gami-server/commit/d9302b57a2bccc61314ee9ea5912a27221cd0ae2\\\",\\\"author\\\":{\\\"name\\\":\\\"Eric Claus Bartholemy\\\",\\\"email\\\":\\\"thnukid@users.noreply.github.com\\\",\\\"username\\\":\\\"thnukid\\\"},\\\"committer\\\":{\\\"name\\\":\\\"Eric Claus Bartholemy\\\",\\\"email\\\":\\\"thnukid@users.noreply.github.com\\\",\\\"username\\\":\\\"thnukid\\\"},\\\"added\\\":[\\\"app/controllers/api/aliases_controller.rb\\\",\\\"app/controllers/api/badges_controller.rb\\\",\\\"spec/controllers/api_controller_spec.rb\\\"],\\\"removed\\\":[\\\"app/controllers/api/api_controller.rb\\\"],\\\"modified\\\":[\\\"app/controllers/application_controller.rb\\\",\\\"config/routes.rb\\\"]}],\\\"head_commit\\\":{\\\"id\\\":\\\"d9302b57a2bccc61314ee9ea5912a27221cd0ae2\\\",\\\"distinct\\\":true,\\\"message\\\":\\\"add resources with user_name to routes, rescue all errors within application controller\\\",\\\"timestamp\\\":\\\"2014-10-13T15:06:10+02:00\\\",\\\"url\\\":\\\"https://github.com/thnukid/gami-server/commit/d9302b57a2bccc61314ee9ea5912a27221cd0ae2\\\",\\\"author\\\":{\\\"name\\\":\\\"Eric Claus Bartholemy\\\",\\\"email\\\":\\\"thnukid@users.noreply.github.com\\\",\\\"username\\\":\\\"thnukid\\\"},\\\"committer\\\":{\\\"name\\\":\\\"Eric Claus Bartholemy\\\",\\\"email\\\":\\\"thnukid@users.noreply.github.com\\\",\\\"username\\\":\\\"thnukid\\\"},\\\"added\\\":[\\\"app/controllers/api/aliases_controller.rb\\\",\\\"app/controllers/api/badges_controller.rb\\\",\\\"spec/controllers/api_controller_spec.rb\\\"],\\\"removed\\\":[\\\"app/controllers/api/api_controller.rb\\\"],\\\"modified\\\":[\\\"app/controllers/application_controller.rb\\\",\\\"config/routes.rb\\\"]},\\\"repository\\\":{\\\"id\\\":23457729,\\\"name\\\":\\\"gami-server\\\",\\\"full_name\\\":\\\"thnukid/gami-server\\\",\\\"owner\\\":{\\\"name\\\":\\\"thnukid\\\",\\\"email\\\":\\\"thnukid@users.noreply.github.com\\\"},\\\"private\\\":false,\\\"html_url\\\":\\\"https://github.com/thnukid/gami-server\\\",\\\"description\\\":\\\"Server to receive gamification events\\\",\\\"fork\\\":false,\\\"url\\\":\\\"https://github.com/thnukid/gami-server\\\",\\\"forks_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/forks\\\",\\\"keys_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/keys{/key_id}\\\",\\\"collaborators_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/collaborators{/collaborator}\\\",\\\"teams_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/teams\\\",\\\"hooks_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/hooks\\\",\\\"issue_events_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/issues/events{/number}\\\",\\\"events_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/events\\\",\\\"assignees_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/assignees{/user}\\\",\\\"branches_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/branches{/branch}\\\",\\\"tags_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/tags\\\",\\\"blobs_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/git/blobs{/sha}\\\",\\\"git_tags_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/git/tags{/sha}\\\",\\\"git_refs_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/git/refs{/sha}\\\",\\\"trees_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/git/trees{/sha}\\\",\\\"statuses_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/statuses/{sha}\\\",\\\"languages_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/languages\\\",\\\"stargazers_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/stargazers\\\",\\\"contributors_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/contributors\\\",\\\"subscribers_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/subscribers\\\",\\\"subscription_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/subscription\\\",\\\"commits_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/commits{/sha}\\\",\\\"git_commits_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/git/commits{/sha}\\\",\\\"comments_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/comments{/number}\\\",\\\"issue_comment_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/issues/comments/{number}\\\",\\\"contents_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/contents/{+path}\\\",\\\"compare_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/compare/{base}...{head}\\\",\\\"merges_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/merges\\\",\\\"archive_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/{archive_format}{/ref}\\\",\\\"downloads_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/downloads\\\",\\\"issues_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/issues{/number}\\\",\\\"pulls_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/pulls{/number}\\\",\\\"milestones_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/milestones{/number}\\\",\\\"notifications_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/notifications{?since,all,participating}\\\",\\\"labels_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/labels{/name}\\\",\\\"releases_url\\\":\\\"https://api.github.com/repos/thnukid/gami-server/releases{/id}\\\",\\\"created_at\\\":1409300896,\\\"updated_at\\\":\\\"2014-09-02T06:40:14Z\\\",\\\"pushed_at\\\":1413205576,\\\"git_url\\\":\\\"git://github.com/thnukid/gami-server.git\\\",\\\"ssh_url\\\":\\\"git@github.com:thnukid/gami-server.git\\\",\\\"clone_url\\\":\\\"https://github.com/thnukid/gami-server.git\\\",\\\"svn_url\\\":\\\"https://github.com/thnukid/gami-server\\\",\\\"homepage\\\":null,\\\"size\\\":19440,\\\"stargazers_count\\\":0,\\\"watchers_count\\\":0,\\\"language\\\":\\\"Ruby\\\",\\\"has_issues\\\":true,\\\"has_downloads\\\":true,\\\"has_wiki\\\":true,\\\"has_pages\\\":false,\\\"forks_count\\\":0,\\\"mirror_url\\\":null,\\\"open_issues_count\\\":1,\\\"forks\\\":0,\\\"open_issues\\\":1,\\\"watchers\\\":0,\\\"default_branch\\\":\\\"master\\\",\\\"stargazers\\\":0,\\\"master_branch\\\":\\\"master\\\"},\\\"pusher\\\":{\\\"name\\\":\\\"thnukid\\\",\\\"email\\\":\\\"thnukid@users.noreply.github.com\\\"},\\\"sender\\\":{\\\"login\\\":\\\"thnukid\\\",\\\"id\\\":1724804,\\\"avatar_url\\\":\\\"https://avatars.githubusercontent.com/u/1724804?v=2\\\",\\\"gravatar_id\\\":\\\"\\\",\\\"url\\\":\\\"https://api.github.com/users/thnukid\\\",\\\"html_url\\\":\\\"https://github.com/thnukid\\\",\\\"followers_url\\\":\\\"https://api.github.com/users/thnukid/followers\\\",\\\"following_url\\\":\\\"https://api.github.com/users/thnukid/following{/other_user}\\\",\\\"gists_url\\\":\\\"https://api.github.com/users/thnukid/gists{/gist_id}\\\",\\\"starred_url\\\":\\\"https://api.github.com/users/thnukid/starred{/owner}{/repo}\\\",\\\"subscriptions_url\\\":\\\"https://api.github.com/users/thnukid/subscriptions\\\",\\\"organizations_url\\\":\\\"https://api.github.com/users/thnukid/orgs\\\",\\\"repos_url\\\":\\\"https://api.github.com/users/thnukid/repos\\\",\\\"events_url\\\":\\\"https://api.github.com/users/thnukid/events{/privacy}\\\",\\\"received_events_url\\\":\\\"https://api.github.com/users/thnukid/received_events\\\",\\\"type\\\":\\\"User\\\",\\\"site_admin\\\":false}}\"}"}
    let(:properties) { ["commits_count"]}
    it 'aggregate properties for the event if they apply' do
    expect{ event.aggregate_properties(properties)}.to change{Fact.count}
    end
  end




end
