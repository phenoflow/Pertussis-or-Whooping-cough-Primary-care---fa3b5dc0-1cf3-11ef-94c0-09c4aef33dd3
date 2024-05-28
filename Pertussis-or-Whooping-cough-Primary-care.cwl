cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  pertussis-or-whooping-cough-primary-care-notification---primary:
    run: pertussis-or-whooping-cough-primary-care-notification---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  pertussis-or-whooping-cough-primary-care-bordetella---primary:
    run: pertussis-or-whooping-cough-primary-care-bordetella---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: pertussis-or-whooping-cough-primary-care-notification---primary/output
  pertussis-or-whooping-cough-primary-care-specified---primary:
    run: pertussis-or-whooping-cough-primary-care-specified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: pertussis-or-whooping-cough-primary-care-bordetella---primary/output
  pertussis-or-whooping-cough-primary-care-coughlike---primary:
    run: pertussis-or-whooping-cough-primary-care-coughlike---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: pertussis-or-whooping-cough-primary-care-specified---primary/output
  pertussis-or-whooping-cough-primary-care-pneumonia---primary:
    run: pertussis-or-whooping-cough-primary-care-pneumonia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: pertussis-or-whooping-cough-primary-care-coughlike---primary/output
  pertussis-or-whooping-cough-primary-care---primary:
    run: pertussis-or-whooping-cough-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: pertussis-or-whooping-cough-primary-care-pneumonia---primary/output
  syncytial-pertussis-or-whooping-cough-primary-care---primary:
    run: syncytial-pertussis-or-whooping-cough-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: pertussis-or-whooping-cough-primary-care---primary/output
  other-pertussis-or-whooping-cough-primary-care---primary:
    run: other-pertussis-or-whooping-cough-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: syncytial-pertussis-or-whooping-cough-primary-care---primary/output
  nucleic-pertussis-or-whooping-cough-primary-care---primary:
    run: nucleic-pertussis-or-whooping-cough-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: other-pertussis-or-whooping-cough-primary-care---primary/output
  pertussis-or-whooping-cough-primary-care-vaccination---primary:
    run: pertussis-or-whooping-cough-primary-care-vaccination---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: nucleic-pertussis-or-whooping-cough-primary-care---primary/output
  pertussis-or-whooping-cough-primary-care-virus---primary:
    run: pertussis-or-whooping-cough-primary-care-virus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: pertussis-or-whooping-cough-primary-care-vaccination---primary/output
  pertussis-or-whooping-cough-primary-care-detected---primary:
    run: pertussis-or-whooping-cough-primary-care-detected---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: pertussis-or-whooping-cough-primary-care-virus---primary/output
  pertussis-or-whooping-cough-primary-care-bronchitis---primary:
    run: pertussis-or-whooping-cough-primary-care-bronchitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: pertussis-or-whooping-cough-primary-care-detected---primary/output
  pertussis-or-whooping-cough-primary-care-species---primary:
    run: pertussis-or-whooping-cough-primary-care-species---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: pertussis-or-whooping-cough-primary-care-bronchitis---primary/output
  pertussis-or-whooping-cough-primary-care-meningioma---primary:
    run: pertussis-or-whooping-cough-primary-care-meningioma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: pertussis-or-whooping-cough-primary-care-species---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: pertussis-or-whooping-cough-primary-care-meningioma---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
