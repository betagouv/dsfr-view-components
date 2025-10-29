module Examples
  module StepperHelpers
    def stepper_default
      '= dsfr_stepper(title: "Choisissez votre ville", value: 3, max: 5, next_title: "Confirmez votre identité")'
    end

    def stepper_last_step
      '= dsfr_stepper(title: "Confirmez votre identité", value: 3, max: 3)'
    end

    def stepper_with_heading_level
      '= dsfr_stepper(title: "Confirmez votre identité", value: 3, max: 3, starting_header_level: 3)'
    end
  end
end
