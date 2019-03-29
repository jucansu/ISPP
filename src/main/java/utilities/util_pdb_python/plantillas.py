plantilla_user_account = \
    """
        <bean id="userAccount{id}" class="security.UserAccount">
            <property name="username" value="{username}" />
            <property name="password" value="1148d7fd446c9a3f86abaf7991390b7e" />
            <property name="authorities">
                <list>
                    <bean class="security.Authority">
                        <property name="authority" value="{authority}" />
                    </bean>
                </list>
            </property>
        </bean>
    """

plantilla_passenger = \
    """
        <bean id="passenger{id}" class="domain.Passenger">
            <property name="name" value="{nombre}" />
            <property name="surname" value="{apellido}" />
            <property name="country" value="Spain" />
            <property name="city" value="Seville" />
            <property name="phone" value="6{telefono}" />
            <property name="cash" value="{dinero}" />
            <property name="bankAccountNumber" value="ES{banco}" />

            <property name="creditCard" ref="creditCard1"/>
            <property name="userAccount" ref="userAccount{id}" />

            <property name="reservations"><list>{reservation_ids}</list></property>
            <property name="comments"><list>{comment_ids}</list></property>
        </bean>
    """

plantilla_driver = \
    """   
        <bean id="driver{id}" class="domain.Driver">
            <property name="name" value="{nombre}" />
            <property name="surname" value="{apellido}" />
            <property name="country" value="Spain" />
            <property name="city" value="Seville" />
            <property name="phone" value="6{telefono}"/>
            <property name="cash" value="{dinero}" />
            <property name="bankAccountNumber" value="ES{banco}" />
            <property name="pets" value="{mascotas}" />
            <property name="smoke" value="{fumar}" />
            <property name="music" value="{musica}" />
            <property name="childs" value="{niños}" />

            <property name="creditCard" ref="creditCard1" />
            <property name="userAccount" ref="userAccount{id_us_acc}" />

            <property name="routes">
                <list>{routes}</list>
            </property>
            <property name="comments">
                <list>{comments}</list>
            </property>
            <property name="vehicles">
                <list>{vehicles}</list>
            </property>
        </bean>
    """

plantilla_route = \
    """
        <bean id="route{id}" class="domain.Route">
            <property name="departureDate" value="{mes}/{dia}/2019 {hora}:{minutos}" />
            <property name="origin" value="{origen}" />
            <property name="destination" value="{destino}" />
            <property name="estimatedDuration" value="{duration}" />
            <property name="daysRepeat" value="{days_repeat}" />
            <property name="availableSeats" value="{seats}" />
            <property name="distance" value="{distancia}" />
            <property name="pricePerPassenger" value="1.1" />
            <property name="details" value=""/>
            <property name="maxLuggage" value="{equipaje}" />
            <property name="isCancelled" value="false" />

            <property name="driver" ref="driver{id_driver}" />
            <property name="vehicle" ref="vehicle{id_vehiculo}" />
            <property name="controlPoints">
                <list></list>
            </property>
            <property name="reservations">
                <list>{reserves}</list>
            </property>
        </bean>
    """

plantilla_vehiculo = \
    """
        <bean id="vehicle{id}" class="domain.Vehicle">
            <property name="model" value="{model}" />
            <property name="vehicleBrand" value="{brand}" />
            <property name="image"
                value="{image}" />
            <property name="seatsCapacity" value="{seats}" />
            <property name="type" value="{type}" />
            <property name="plate" value="{plate}" />
            <property name="description" value=" " />

            <property name="driver" ref="driver{driver_id}" />
            <property name="routes">
                <list>{routes}</list>
            </property>
        </bean>
    """

plantilla_reservation = \
    """
            <bean id="reservation{id}" class="domain.Reservation">
                <property name="luggageSize" value="{luggage}" />
                <property name="price" value="{price}" />
                <property name="origin" value="{origin}" />
                <property name="destination" value="{destination}" />
                <property name="seat" value="{seat}" />
                <property name="status" value="{status}" />
                
    
                <property name="passenger" ref="passenger{passenger_id}" />
                <property name="route" ref="route{route_id}" />            
            </bean>
    """
