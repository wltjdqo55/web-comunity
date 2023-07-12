package com.inven.project.command;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import javax.servlet.*;

public interface Command {
	void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
