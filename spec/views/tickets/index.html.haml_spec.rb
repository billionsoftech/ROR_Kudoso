%h1 Listing #{@ticket_type.name} #{params[:closed] ? 'Closed' : 'Openned'} Tickets

.panel
  %p
    - @ticket_types.each do |tt|
      - if tt.id == @ticket_type.id
        #{tt.name}
      -else
        = link_to tt.name, admin_tickets_path(ticket_type_id: tt.id)
  %p
    - if params[:open]
      Open Tickets
      = link_to 'Closed Tickets',   admin_tickets_path(ticket_type_id: params[:ticket_type_id], open: false)
    -else
      = link_to 'Open Tickets',   admin_tickets_path(ticket_type_id: params[:ticket_type_id])
      Closed Tickets
    %p
    - if params[:assigned_to_id].to_i == current_user.id
      = link_to 'All Tickets',   admin_tickets_path(ticket_type_id: params[:ticket_type_id], open: params[:open])
      My Tickets
    -else
      All Tickets
      = link_to 'My Tickets',   admin_tickets_path(ticket_type_id: params[:ticket_type_id], open: params[:open], assigned_to_id: current_user.id)

= paginate @tickets
%table
  %tr
    %th Assigned to
    %th User
    %th Contact
    %th Type
    %th Openned
    %th Closed
    %th Status
    %th
    %th
    %th

  - @tickets.each do |ticket|
    %tr
      %td= ticket.assigned_to.try(:full_name)
      %td= ticket.user_id
      %td= ticket.contact.try(:full_name)
      %td= ticket.ticket_type.name
      %td= ticket.date_openned
      %td= ticket.date_closed
      %td= ticket.status
      %td= link_to 'Details', [:admin, ticket]
      %td= link_to 'Edit', edit_admin_ticket_path(ticket)


%br
= paginate @tickets
%br
= link_to 'New Ticket', new_admin_ticket_path