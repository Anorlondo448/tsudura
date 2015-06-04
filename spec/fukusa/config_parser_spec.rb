require File.expand_path(File.join('../', 'spec_helper'), File.dirname(__FILE__))

describe Fukusa::ConfigParser do
  describe "#attributes" do
    context "sample1" do
      let(:config_obj) { described_class.new("#{APP_ROOT}/spec/samples/yamls/sample1.yml") }

      it do
        expect(config_obj.attributes).to match(
          service: "fukusa",
          environment: "staging",
          region: "ap-northeast-1",
          security_group_id: "sg-aad34bcf",
          subnet_id: "subnet-cd985794",
          image_id: "ami-cbf90ecb",
          key_name: "fukusa_staging",
          playbook_path: "spec/samples/ansible_playbook/staging.yml",
          instance_type: "t2.micro",
          inventory_file: "~/.ansible/ec2.py",
          vault_password: "fukusa",
          user_data_script: "#!/bin/bash -ex\nsu - deploy /home/deploy/startup.sh staging",
        )
      end
    end
  end
end
