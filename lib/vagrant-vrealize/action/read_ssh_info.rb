require "log4r"

module VagrantPlugins
  module Vrealize
    module Action
      # This action reads the SSH info for the machine and puts it into the
      # `:machine_ssh_info` key in the environment.
      class ReadSSHInfo
        def initialize(app, env)
          @app    = app
          @logger = Log4r::Logger.new("vagrant_vrealize::action::read_ssh_info")
        end

        def call(env)
         env[:machine_ssh_info] = read_ssh_info(env[:vra], env[:machine])

         @app.call(env)
        end

        def read_ssh_info(vra, machine)
          if machine.id
            vra.ssh_info(machine.id)
          end
        end
      end
    end
  end
end
