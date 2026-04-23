name: Architecture Change Proposal
description: Propose a change to **dawnset** architecture  

labels: [architecture]
body:
  - type: textarea
    id: summary
    attributes:
      label: Summary
      description: Describe the proposed architectural change.
    validations:
      required: true

  - type: textarea
    id: rationale
    attributes:
      label: Rationale
      description: Why is this change necessary?
    validations:
      required: true

  - type: textarea
    id: impact
    attributes:
      label: Impact Analysis
      description: Describe how this change affects modules, crates, or documentation.
    validations:
      required: true

  - type: textarea
    id: alternatives
    attributes:
      label: Alternatives Considered
      description: List any alternative approaches
