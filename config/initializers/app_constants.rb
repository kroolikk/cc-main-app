# -*- encoding: utf-8 -*-

ROLES = [['Użytkownik', 'user'], ['Moderator', 'mod'], ['Admin', 'admin']]

MAIN_CATEGORIES = [{:id => 1, :name => "Rozrywka", :url_param => "rozrywka", :cl => "roz"},
                   {:id => 2, :name => "Kultura", :url_param => "kultura", :cl => "kul"},
                   {:id => 3, :name => "Studia", :url_param => "studia", :cl => "stu"},
                   {:id => 4, :name => "Lifestyle", :url_param => "lifestyle", :cl => "lif"},]

MONTHS_TO_SELECT = [['styczeń', 1], ['luty', 2], ['marzec', 3], ['kwiecień', 4],
                    ['maj', 5], ['czerwiec', 6], ['lipiec', 7], ['sierpień', 8],
                    ['wrzesień', 9], ['październik', 10], ['listopad', 11], ['grudzień', 12]]

WEEK_TO_SELECT = [['1 - 8', 1], ['9 - 16', 2], ['17 - 24', 3], ['25 - 31', 4]]                    





DESCRIPTION_EXAMPLE = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla non mauris id mi bibendum vulputate. Donec adipiscing nisl eget justo pulvinar ultricies. Ut tristique iaculis justo vitae tincidunt. Etiam risus sapien, luctus eget iaculis id, mollis ut leo. Nunc et tempor sapien. Ut et metus non urna placerat cursus malesuada ac nunc. Vestibulum magna dolor, interdum ac auctor at, iaculis vel mi. Quisque at consequat purus. Sed elit dolor, imperdiet ac vehicula sit amet, lacinia vitae felis. Etiam dapibus auctor auctor. Ut eu ante augue, in viverra orci. Ut ut tortor sapien, id vulputate risus. In mollis mollis adipiscing. Ut fringilla fringilla justo et aliquam. Nam rhoncus bibendum lacus. Fusce sollicitudin, turpis ut pharetra sagittis, erat ipsum semper velit, at tempus nulla ante at ipsum. Morbi non dolor justo. Suspendisse ultricies, nisl a imperdiet laoreet, neque magna fermentum lectus, eget ullamcorper nisl turpis vitae leo. Sed porta orci id lacus egestas mollis. Sed laoreet luctus dictum. Duis ipsum mi, convallis eget posuere convallis, facilisis a dui. Sed eros nisl, porttitor eu sollicitudin nec, imperdiet et nunc. Curabitur vestibulum interdum hendrerit. Maecenas varius est ut lorem euismod et dignissim neque vulputate. Phasellus sagittis risus et magna luctus eget ullamcorper sem ultrices. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam ac ante ligula, sed commodo urna. In hac habitasse platea dictumst. Ut rutrum lobortis tellus ut rutrum. Phasellus adipiscing auctor sapien, vel pretium lectus pharetra sit amet. Phasellus justo arcu, ultricies a bibendum sed, egestas ac nisl. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent hendrerit erat eu mauris scelerisque eleifend. Fusce id erat turpis. Cras non leo nec leo dictum congue semper ut ipsum. Morbi egestas pretium sapien, vel euismod elit luctus quis. Mauris elementum, leo porta venenatis eleifend, dolor nunc ultrices dolor, et dignissim velit sapien et erat. Vivamus euismod blandit est non lobortis. Vestibulum magna nulla, accumsan quis placerat vel, semper nec quam. Ut molestie, urna non sagittis vulputate, sapien ante scelerisque est, ac faucibus tortor enim eleifend urna. Duis enim ipsum, laoreet a vulputate ac, pretium et eros. Proin pharetra enim sit amet mauris mattis euismod. Vivamus placerat fermentum nulla, ut convallis orci malesuada ut. Mauris varius diam at lacus tristique nec eleifend justo laoreet. Vestibulum rhoncus tellus id lorem tempus at vulputate neque ullamcorper."

SQLOrigin.append_to_log
# SQLOrigin.append_to_query