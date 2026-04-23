name: Feature Request
description: Propose a new feature or enhancement for **dawnset**
labels: [enhancement]
body:
  - type: textarea
    id: summary
    attributes:
      label: Summary
      description: Describe the feature you want to propose.
    validations:
      required: true

  - type: dropdown
    id: area
    attributes:
      label: Related Area
      options:
        - transport
        - routing
        - discovery
        - core
        - documentation
        - other
    validations:
      required: true

  - type: textarea
    id: motivation
    attributes:
      label: Motivation
      description: Why is this feature important?
    validations:
      required: true

  - type: textarea
    id: design
    attributes:
      label: Proposed Design
      description: Describe how the feature should work.
