# npc-exploration

This project makes it easy to spin up throwaway Nonprofit Cloud exploration environments using CumulusCI. It provides automated org setup plus a growing library of scenario-based sample datasets to help you explore the new on-platform Nonprofit Cloud architecture.

This project is community-driven and not affiliated with Salesforce. It is a work in progress — configurations, datasets, and automation will continue to evolve.

--> **Visit the [project wiki](https://github.com/Sundae-Shop-Consulting/npc-exploration/wiki) for dataset details, scenarios, and more info.** <--

## Getting Started: Create an Exploration Org

To create a scratch org using this configuration:

1. **Set up CumulusCI**  
   https://cumulusci.readthedocs.io/en/latest/tutorial.html

2. **Create a scratch org**  
   `cci org scratch dev explore --default --days 30`
   
3. **Deploy metadata and assign permissions**
   `cci flow run dev_org`
   
5. **Open the org**
   `cci org browser`

This builds an org with core Nonprofit Cloud features enabled — including Fundraising, Program Management, Volunteer Management, and Grantmaking — plus baseline configuration to support dataset loading. Experience Cloud setup will be added in future versions.

![Screenshot of the app](docs/images/npc_app_screenshot.png)

## Learn More & Contribute

The [wiki](https://github.com/Sundae-Shop-Consulting/npc-exploration/wiki) includes:
- Overview and project context
- Pages for each dataset (Households, Fundraising, Case Management, Volunteer Management)

Contributions are welcome — you do not need deep CCI or Git knowledge to get involved!
