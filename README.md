# npc-exploration

The goal of this project is to make it possible to easily explore Nonprofit Cloud features using default configurations and sample datasets, like an NPC trial org but in a throwaway environment. This project is not affiliated with Salesforce and the actual trial experience will differ now and may deviate going forward. This is a work in progress and nothing should be considered complete yet.

## Development

To work on this project in a scratch org:

1. [Set up CumulusCI](https://cumulusci.readthedocs.io/en/latest/tutorial.html)
2. Run `cci org scratch dev explore --default` to deploy this project and assign yourself a whole bunch of permissions.
3. Run `cci flow run dev_org` to deploy this project and assign yourself a whole bunch of permissions.
4. Run `cci org browser` to open the org in your browser.

This will create a scratch org with a number of NPC features enabled, including Fundraising, Grantmaking, and Program Management. 