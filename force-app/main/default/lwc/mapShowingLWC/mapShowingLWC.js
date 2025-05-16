import { LightningElement } from "lwc";

export default class MapShowing extends LightningElement {
  mapMarkers;
  zoomLevel;
  listView;
  connectedCallback() {
    this.mapMarkers = [
      {
        location: {
          City: "Alwar",
          Country: "India",
          PostalCode: "301001",
          State: "RJ",
          Street: "Moti Dungri"
        },
        title: "SLT",
        description: "PVT Company",
        icon: "standard:account"
      },
        ];
    this.zoomLevel = 10;
    this.listView = "visible";
  }
}