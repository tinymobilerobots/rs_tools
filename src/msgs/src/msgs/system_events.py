#!/usr/bin/env python

#from msgs.msg import SystemEvent, KeyData


class SystemEvents:
    @staticmethod
    def user_info(event):
        info_text = None
        event_info = {}
        for info in event.info:
            event_info[info.key] = info.data

        if event.node == "usb_loader":
            if event.event == "config_loaded":
                info_text = "Loaded {count_ok}/{count_total} config.".format(count_ok=event_info["count_ok"], count_total=event_info["count_total"])
            elif event.event == "config_not_found":
                info_text = "No config found"
            elif event.event == "config_failed":
                info_text = "Failed to load config"

            elif event.event == "usb_failed":
                info_text = "Not saved to USB"
            elif event.event == "usb_save":
                if event_info["succeeded"] == "True":
                    info_text = "Saved"
                else:
                    info_text = "{user_info}: {job}".format(user_info=event_info["user_info"], job=event_info["job_name"])
        elif event.node == "job_controller":
            if event.event == "job_task_point_collected":
                info_text = "Point collected"
            elif event.event == "job_done":
                info_text = "Job done"
            elif event.event == "task_near_found":
                info_text = "Found nearest task"
            elif event.event == "job_loaded":
                info_text = "Job loaded"

        elif event.node == "system_config":
            if event.event == "config_updated":
                info_text = "System {} update".format(event_info["configuration_type"])
            elif event.event == "wifi_connect":
                info_text = "System wifi connect"

        elif (
                event.node == "internet_connection" and
                event.event == "internet_connectivity"
                ):
            if event_info["connected"]:
                info_text = "Internet connected"
            else:
                info_text = "Internet offline"

        elif (event.node == "app" and event.event == "config_updated"):
            info_text = "Updated {}".format(event_info["configuration_type"])

        return info_text
